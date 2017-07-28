{{cookiecutter.organization}} {{cookiecutter.model_identifier.upper()}} Model README
====================================================================================

## Cloning the repository

You can clone this repository using HTTPS or SSH, but it is recommended that that you use SSH: first ensure that you have generated an SSH key pair on your local machine and add the public key of that pair to your GitHub account (use the GitHub guide at https://help.github.com/articles/connecting-to-github-with-ssh/). Then run

    git clone --recursive git+ssh://git@github.com/OasisLMF/{{cookiecutter.project_slug.replace(' ', '')}}

To clone over HTTPS use

    git clone --recursive https://github.com/OasisLMF/{{cookiecutter.project_slug.replace(' ', '')}}.git

You may receive a password prompt - to bypass the password prompt use

    git clone --recursive https://<GitHub user name:GitHub password>@github.com/OasisLMF/{{cookiecutter.project_slug.replace(' ', '')}}.git

The `--recursive` option ensures the cloned repository contains the necessary Oasis repositories <a href="https://github.com/OasisLMF/oasis_utils" target="_blank">`oasis_utils`</a>, <a href="https://github.com/OasisLMF/oasis_keys_server" target="_blank">`oasis_keys_server`</a> and <a href="https://github.com/OasisLMF/oasis_build_utils" target="_blank">`oasis_build_utils`</a> as Git submodules. You have read only access to these repositories.


## Managing the submodules

Run the command

    git submodule

to list the submodules (latest commit IDs, paths and branches). If any are missing then you can add them using

	git submodule add <submodule GitHub repo URL> <local path/destination>

It is a quirk of Git that the first time you clone a repository with submodules they will be checked out as commits not branches, which is not what you want. You should run the command

    git submodule foreach 'git checkout master'

to ensure that the Oasis submodules are checked out on the `master` branches.

If you've already cloned the repository and wish to update the submodules (all at once) in your working directory from their GitHub repositories then run

    git submodule foreach 'git pull origin'

You can also update the submodules individually by pulling from within them.

You should not make any local changes to these submodules because you have read-only access to these submodules on GitHub and you will not be able push your changes to GitHub. So submodule changes can only propagate from GitHub to your local repository. To detect these changes you can run `git status -uno` and to commit them you can add the paths and commit them in the normal way.

## Building and running the keys server

First, ensure that you have Docker installed on your system and that your Unix user has been added to the `docker` user group (run `sudo usermod -a -G docker $USER`).

There are two ways of building and running the keys server - either using a built-in shell script in the <a href="https://github.com/OasisLMF/oasis_build_utils" target="_blank">`oasis_build_utils`</a> submodule provided by Oasis or directly using Docker.

To use the shell script first load the build configuration file for the keys server (from the base of the repository) by running

    . oasis_build_utils/keys_server_build_utils.sh <keys server build config file name>

This loads build parameters needed by the script, such as the supplier, model name, version, path to the keys data files etc. - if there are errors or missing parameters please change the build config file and run the same command again. Then run

    start_keys_server

This will build the keys server image (calls the function `build_image`), run the image in a container (`run_container`) and run a healthcheck (`healthcheck`). If you want to do these steps separately call the relevant functions separately.

If you prefer to use Docker directly to build the image then you can run the following command (from the base of the repository)

    sudo docker build -f <docker file name> -t <image name/tag> .

Run `docker images` to list all images and check the one you've built exists. To run the image in a container you can use the command

    docker run -dp 5000:80 --name=<container name/tag> <image name/tag>

To check the container is running use the command `docker ps`. If you want to run the healthcheck on the keys server then use the command

    curl -s http://<server or localhost>:5000/{{cookiecutter.organization.replace(' ', '')}}/{{cookiecutter.model_identifier.replace(' ', '').upper()}}/{{cookiecutter.model_version}}/healthcheck

You should get a response of `OK` if the keys server has initialised and is running normally, otherwise you should get the HTML error response from Apache. To enter the running container you can use the command

    docker exec -it <container name> bash

The log files to check are `/var/log/apache/error.log` (Apache error log), `/var/log/apache/access.log` (Apache request log), and `/var/log/oasis/keys_server.log` (the keys server Python log). In case of request timeout issues you can edit the `Timeout` option value (in seconds) in the file `/etc/apache2/sites-available/oasis.conf` and restart Apache (`service apache2 restart`).
