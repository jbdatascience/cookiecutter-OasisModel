# cookiecutter-OasisModel
A cookie cutter project structure for Oasis models that can be replicated using the <a href="https://pypi.python.org/pypi/cookiecutter" target="_blank">`cookiecutter` Python tool</a>:

    # Install the cookiecutter tool (if not present)
    /home/foo$ pip install cookiecutter
    
    # Run cookiecutter
    /home/foo$ cookiecutter https://github.com/OasisLMF/cookiecutter-OasisModel

You should see the following prompts for project and model settings in sequence (press ENTER to use default values):
    
    project_name [Oasis Model]:
    project_slug [gc-cnfl]: 
    project_short_description [Oasis Model]:
    version [0.0.1]: 
    primary_language [Python]: 
    organization [ORG]:
    model_identifier [MODEL]:
    model_version [0.0.0.1]: 
    email [mark.pinkerton@oasislmf.org]: 

The project structure is contained in the repo folder named <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> and project-related settings such as the project descriptive name, model name and version etc. are configurable in the repo file <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/blob/master/cookiecutter.json" target="_blank">`cookiecutter.json`</a> and set during runtime by prompts.

For the current state of the <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> directory you should see the following project structure in the place where you ran the command (assuming you used default boilerplate values for the project name, organization and model name):

    Oasis_Model/
    ├── Dockerfile.ORG_MODEL_keys_server
    ├── Dockerfile.ORG_MODEL_model_execution_worker
    ├── LICENSE
    ├── README.md
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
    ├── keys_server_config/
    │   ├── apache.conf
    │   ├── oasis.conf
    │   └── oasis.wsgi
    ├── model_data/
    │   ├── damage_bin_dict.bin
    │   ├── damage_bin_dict.csv
    │   ├── data.csv
    │   ├── events.bin
    │   ├── events.csv
    │   ├── footprint.bin
    │   ├── footprint.csv
    │   ├── footprint.idx
    │   ├── occurrence.bin
    │   ├── occurrence.csv
    │   ├── random.bin
    │   ├── random.csv
    │   ├── returnperiods.bin
    │   ├── returnperiods.csv
    │   ├── vulnerability.bin
    │   └── vulnerability.csv
    └── src/
        ├── keys_server/
        │   ├── KeysLookup.py
        │   ├── __init__.py
        │   └── utils.py
        ├── model_execution_worker/
        │   └── ORG/
        │       ├── __init__.py
        │       └── supplier_model_runner.py
        ├── oasis_keys_lookup/
        │   ├── BaseKeysLookup.py
        │   ├── README.md
        │   └── __init__.py
        ├── oasis_keys_server/
        │   ├── KeysServer.ini
        │   ├── README.md
        │   ├── __init__.py
        │   ├── app.py
        │   ├── requirements.txt
        │   └── startup.sh
        └── oasis_utils/
            ├── __init__.py
            ├── oasis_db_utils.py
            ├── oasis_log_utils.py
            ├── oasis_sys_utils.py
            ├── oasis_utils.py
            └── requirements.txt

    17 directories, 72 files
