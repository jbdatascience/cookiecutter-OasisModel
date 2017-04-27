# cookiecutter-OasisModel
A cookiecutter project structure for Oasis models that can be replicated using the <a href="https://pypi.python.org/pypi/cookiecutter" target="_blank">`cookiecutter` Python tool</a>:

    # Install the cookiecutter tool (if not present)
    /home/foo$ pip install cookiecutter
    
    # Run cookiecutter on the source repo (the URI can be specified using either https or git+ssh)
    /home/foo$ cookiecutter git+ssh://git@github.com/OasisLMF/cookiecutter-OasisModel

You should see the following prompts for project and model settings in sequence (press ENTER to use default values):
    
    project_name [Oasis Model]:
    project_slug [OasisModel]: 
    project_short_description [Oasis Model]:
    version [0.0.1]: 
    primary_language [Python]: 
    organization [ORG]:
    model_identifier [MODEL]:
    model_version [0.0.0.1]: 
    email [mark.pinkerton@oasislmf.org]: 

These prompts are self-explanatory, but `project_name`, `project_slug`, `organization`, `model_identifier` and `model_version` are mandatory, while the others are optional. Here are some guidelines to follow for the mandatory prompts.

* `project_name` should be a concise title for the project (title words should be capitalised)
* `project_slug` is the folder name for the project and by default cookiecutter will set this to a camel casing of the `project_name` value, but you may enter a specific value yourself, provided it does not contain spaces or any special characters not normally present in folder names
* `organization` should either be a camel case of the organization name or an acronym
* `model_identifier` should be an acronym of the model name
* `model_version` this can be any meaningful string that indicates a version for the model (by default it is set to `0.0.0.1`)

The project structure is contained in the repo folder named <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> and project-related settings such as the project descriptive name, model name and version etc., which are set during runtime via the prompts, are configurable in the repo file <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/blob/master/cookiecutter.json" target="_blank">`cookiecutter.json`</a>.

For the current state of the <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> directory you should see the following project structure in the place where you ran the command (assuming you used default boilerplate values for the project name, organization and model name):

    OasisModel/
    ├── Dockerfile.org_model_keys_server
    ├── Dockerfile.org_model_model_execution_worker
    ├── flamingo/
    │   └── generic_model/
    │       ├── Files/
    │       ├── MappingFiles/
    │       │   ├── Generic_Earthquake_CanLoc_BToModelLoc.mfd
    │       │   ├── Generic_Earthquake_SourceLocToCanLoc_A.mfd
    │       │   ├── Generic_Flood_CanLoc_BToModelLoc.mfd
    │       │   ├── Generic_Flood_SourceLocToCanLoc_A.mfd
    │       │   ├── Generic_SourceAccToCanAcc_A.mfd
    │       │   ├── Generic_Windstorm_CanLoc_BToModelLoc.mfd
    │       │   └── Generic_Windstorm_SourceLocToCanLoc_A.mfd
    │       ├── SQLFiles/
    │       ├── TransformationFiles/
    │       │   ├── MappingMapToGeneric_CanAcc_A.xslt
    │       │   ├── MappingMapToGeneric_Earthquake_CanLoc_A.xslt
    │       │   ├── MappingMapToGeneric_Earthquake_ModelLoc.xslt
    │       │   ├── MappingMapToGeneric_Flood_CanLoc_A.xslt
    │       │   ├── MappingMapToGeneric_Flood_ModelLoc.xslt
    │       │   ├── MappingMapToGeneric_Windstorm_CanLoc_A.xslt
    │       │   └── MappingMapToGeneric_Windstorm_ModelLoc.xslt
    │       └── ValidationFiles/
    │           ├── Generic_CanAcc_A.xsd
    │           ├── Generic_CanAcc_B.xsd
    │           ├── Generic_Earthquake_CanLoc_A.xsd
    │           ├── Generic_Earthquake_CanLoc_B.xsd
    │           ├── Generic_Earthquake_ModelLoc.xsd
    │           ├── Generic_Earthquake_SourceLoc.xsd
    │           ├── Generic_Flood_CanLoc_A.xsd
    │           ├── Generic_Flood_CanLoc_B.xsd
    │           ├── Generic_Flood_ModelLoc.xsd
    │           ├── Generic_Flood_SourceLoc.xsd
    │           ├── Generic_SourceAcc.xsd
    │           ├── Generic_Windstorm_CanLoc_A.xsd
    │           ├── Generic_Windstorm_CanLoc_B.xsd
    │           ├── Generic_Windstorm_ModelLoc.xsd
    │           └── Generic_Windstorm_SourceLoc.xsd
    ├── keys_data/
    │   └── MODEL/
    │       └── ModelVersion.csv
    ├── keys_server_config/
    │   ├── apache2.conf
    │   ├── oasis.conf
    │   └── oasis.wsgi
    ├── LICENSE
    ├── model_data/
    │   └── MODEL/
    │       ├── damage_bin_dict.bin
    │       ├── damage_bin_dict.csv
    │       ├── data.csv
    │       ├── events.bin
    │       ├── events.csv
    │       ├── footprint.bin
    │       ├── footprint.csv
    │       ├── footprint.idx
    │       ├── ModelVersion.csv
    │       ├── occurrence.bin
    │       ├── occurrence.csv
    │       ├── random.bin
    │       ├── random.csv
    │       ├── returnperiods.bin
    │       ├── returnperiods.csv
    │       ├── vulnerability.bin
    │       └── vulnerability.csv
    ├── README.md
    └── src/
        ├── keys_server/
        │   ├── MODELKeysLookup.py
        │   ├── __init__.py
        │   ├── requirements.txt
        │   └── utils/
        │       └── __init__.py
        ├── model_execution_worker/
        │   └── OasisModel/
        │       ├── __init__.py
        │       └── supplier_model_runner.py
        ├── oasis_keys_lookup/
        │   ├── BaseKeysLookup.py
        │   ├── __init__.py
        │   └── README.md
        ├── oasis_keys_server/
        │   ├── app.py
        │   ├── __init__.py
        │   ├── KeysServer.ini
        │   ├── README.md
        │   ├── requirements.txt
        │   └── startup.sh
        └── oasis_utils/
            ├── __init__.py
            ├── oasis_db_utils.py
            ├── oasis_log_utils.py
            ├── oasis_sys_utils.py
            ├── oasis_utils.py
            └── requirements.txt

    20 directories, 75 files

