#!/usr/bin/env bash
#
# AUTHOR:       Sandeep Murthy
# DATE:         17/05/2017
# ORGANIZATION: Oasis Loss Modelling Framework
# EMAIL:        sandeep.murthy@oasislmf.org
#
# Bash utilities for building/running keys server Docker images/containers. To
# build a keys server for a particular supplier, model and version the script
# requires that 
#
#   (1) the Docker service is running
#   (2) you are located inside the local Git repository for the supplier
#   (3) a config file exists in this repository for the particular keys server
#      (model, version) you want to build
#
# The config file must be a Bash script that exports parameters needed for the
# build. The following build parameters are required in the config file:
#
#   * SUPPLIER - name of the supplier as given in the relevant model version file
#
#   * LOCAL_SUPPLIER_HOME - the (relative or absolute) path of the local Git
#                           repository for the supplier on the system; you can
#                           use the value of SUPPLIER or of the HOME environment
#                           variable on your system
#
#   * MODEL_NAME - name of the model as given in the model version file
#
#   * MODEL_VERSION - version of the model as given in the model version file
#
#   * DOCKERFILE - the name of the Dockerfile for the keys server
#
#   * BUILD_IMAGE_NAME - the intended name of the Docker image
#
#   * BUILD_CONTAINER_NAME - the intended name of the container
#
#   * LOCAL_KEYS_DATADIR - since the keys data directory is not version controlled
#                          this variable should store the path of model keys data
#                          directory; by default it is expected to be a subfolder
#                          of the keys_data directory in the supplier repo, named
#                          by the relevant model
#
#   * LOCAL_TEST_MODEL_LOCATION_FILE - the path of the model location file you
#                                      want to use for sending a keys request to the
#                                      web service running in the container; by
#                                      default an executable CSV file is expected,
#                                      other formats will cause a request failure;
#                                      the format should not be raw but consistent with
#                                      the format produced by Flamingo after the
#                                      transforms; by default this file is expected
#                                      to be found in the model subdirectory within
#                                      keys data directory
#
# To use the build utilities source the script in the following way:
#
#    $ . /path/to/build/keys_server_docker_build_utils.sh /path/to/keys/server/config/file
#
# This will export all of the utility functions into the shell. Then run the
# run the particular function you want to use, e.g.
#
#    $ build_image
#
# Different config files should be created for different supplier-model-version
# combinations (inside the relevant supplier Git repositories on the system you
# are building on), but the script must be sourced (as described above) every
# time you build a different keys server for the same supplier in the same
# repository.

KEYS_SERVER_DOCKER_CONFIG_FILE=$1
source ${KEYS_SERVER_DOCKER_CONFIG_FILE}
printf "\n\nLoading keys server Docker build config file ${KEYS_SERVER_DOCKER_CONFIG_FILE} for ${SUPPLIER}, ${MODEL_NAME}, ${MODEL_VERSION}.\n\n"
sleep 3

export SERVICE_APACHE_LOGDIR=/var/log/apache2
export SERVICE_URL=http://localhost:5000
export SERVICE_BASE=${SUPPLIER}/${MODEL_NAME}/${MODEL_VERSION}
export SERVICE_DATADIR=/var/oasis/keys_data
export SERVICE_OASIS_LOGDIR=/var/log/oasis


function build_image {
    printf "\nBuilding keys server ${BUILD_IMAGE_NAME} Docker image from Dockerfile ${DOCKERFILE}.\n\n"
    sleep 3
    docker build -f ${DOCKERFILE} -t ${BUILD_IMAGE_NAME} ${LOCAL_SUPPLIER_HOME}
    if [ $? -gt 0 ]
    then
        printf "\nError - 'docker build' command failed with exit code $?.\n\n";
    fi
}

export -f build_image


function run_container {
    printf "\nRunning keys server Docker image ${BUILD_IMAGE_NAME} in container ${BUILD_CONTAINER_NAME}.\n\n"
    sleep 3
    docker run -dp 5000:80 --name=${BUILD_CONTAINER_NAME} ${BUILD_IMAGE_NAME}
    if [ $? -eq 0 ]
    then
        docker ps -n 1
    else
        printf "\nError - 'docker run' command failed with exit code $?.\n\n"
    fi
}

export -f run_container


function install_keys_data {
    printf "\nCopying keys data files to keys server container.\n\n"
    data_files=${LOCAL_KEYS_DATADIR}/${MODEL_NAME}/*.csv
    sleep 3
    for f in $data_files
    do
        printf "\n\tCopying file $f to ${BUILD_CONTAINER_NAME}:${SERVICE_DATADIR}"
        sleep 1
        docker cp "$f" ${BUILD_CONTAINER_NAME}:${SERVICE_DATADIR}
    done
    printf "\n"
}

export -f install_keys_data


function set_keys_data_permissions {
    printf "\nSetting keys data permissions in keys server container service data directory ${SERVICE_DATADIR}.\n\n"
    sleep 3
    docker exec -it ${BUILD_CONTAINER_NAME} chmod -R 777 ${SERVICE_DATADIR}
    printf "\n"
}

export -f set_keys_data_permissions


function enter_container {
    printf "\nEntering keys server container ${BUILD_CONTAINER_NAME} in Bash shell.\n\n"
    sleep 3
    docker exec -it ${BUILD_CONTAINER_NAME} bash
    printf "\n"
}

export -f enter_container


function refresh_container {
    printf "\nRefreshing keys server container ${BUILD_CONTAINER_NAME} \(clearing all log files, restarting Apache\).\n\n"
    sleep 3
    docker exec -it ${BUILD_CONTAINER_NAME} service apache2 stop
    docker exec -it ${BUILD_CONTAINER_NAME} >${APACHE_LOGDIR}/error.log
    docker exec -it ${BUILD_CONTAINER_NAME} >${APACHE_LOGDIR}/access.log
    docker exec -it ${BUILD_CONTAINER_NAME} >${SERVICE_OASIS_LOGDIR}/keys_server.log
    docker exec -it ${BUILD_CONTAINER_NAME} service apache2 start
    printf "\n"
}

export -f refresh_container


function kill_container {
    printf "\nKilling keys server container ${BUILD_CONTAINER_NAME}.\n\n"
    sleep 3
    docker kill ${BUILD_CONTAINER_NAME}
    printf "\n"
}

export -f kill_container


function remove_container {
    printf "\nRemoving keys server container ${BUILD_CONTAINER_NAME}.\n\n"
    sleep 3
    docker rm -f ${BUILD_CONTAINER_NAME}
    printf "\n"
}

export -f remove_container


function delete_image {
    printf "\nDeleting keys server Docker image ${BUILD_IMAGE_NAME}.\n\n"
    sleep 3
    docker rmi -f ${BUILD_IMAGE_NAME}
    printf "\n"
}

export -f delete_image


function healthcheck {
    #base_url = "${SERVICE_URL}/${SERVICE_BASE}"
    printf "\nRunning healthcheck on keys server ${BUILD_CONTAINER_NAME}.\n\n"
    sleep 3    
    local res="$(curl -s ${SERVICE_URL}/${SERVICE_BASE}/healthcheck)"
    printf " ${res}\n"
}

export -f healthcheck


function get_keys {
    #base_url = "${SERVICE_URL}/${SERVICE_BASE}"
    printf "\nRunning a keys request on keys server ${BUILD_CONTAINER_NAME} using test model location file ${LOCAL_TEST_MODEL_LOCATION_FILE}.\n\n"
    sleep 3  
    curl ${SERVICE_URL}/${SERVICE_BASE}/get_keys --data-binary @${LOCAL_KEYS_DATADIR}/${LOCAL_TEST_MODEL_LOCATION_FILE} -H 'Content-type:text/csv; charset=utf-8'
    printf "\n"
}

export -f get_keys
