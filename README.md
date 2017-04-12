# cookiecutter-OasisModel
A cookie cutter project structure for Oasis models that can be replicated using the <a href="https://pypi.python.org/pypi/cookiecutter" target="_blank">`cookiecutter` Python tool</a>:

    # Install the cookiecutter tool (if not present)
    /home/foo$ pip install cookiecutter
    
    # Run cookiecutter
    /home/foo$ cookiecutter https://github.com/OasisLMF/cookiecutter-OasisModel

You should see the following prompts for project and model settings (use ENTER to use default values):
    
    project_name [Oasis Model]: GC-CNFL
    project_slug [gc-cnfl]: 
    project_short_description [Oasis Model]: Guy Carpenter Canadian flood loss model
    version [0.0.1]: 
    primary_language [Python]: 
    organization [ORG]: GC
    model_identifier [MODEL]: CNFL
    model_version [0.0.0.1]: 
    email [mark.pinkerton@oasislmf.org]: 

The project structure is contained in the repo folder named <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> and project-related settings such as the project descriptive name, model name and version etc. are configurable in the repo file <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/blob/master/cookiecutter.json" target="_blank">`cookiecutter.json`</a> and set during runtime by prompts.

For the current state of the <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> directory you should see the following project structure in the place where you ran the command (assuming you used default boilerplate values for the project name, organization and model name):

    Oasis_Model/
    ├── Dockerfile.ORG_MODEL_keys_server
    ├── Dockerfile.ORG_MODEL_model_execution_worker
    ├── LICENSE
    ├── README.md
    ├── example_data/
    │   ├── Exposures/
    │   │   ├── CanAcc_PiWindP1.csv
    │   │   ├── CanAcc_PiWindP1_B.csv
    │   │   ├── CanLoc_PiWindP1.csv
    │   │   ├── CanLoc_PiWindP1_B.csv
    │   │   ├── ModelLoc_PiWind.csv
    │   │   ├── SourceAcc_PiWindP1.csv
    │   │   └── SourceLoc_PiWindP1.csv
    │   ├── MappingFiles/
    │   │   ├── CanLocToModelLocDefault.mfd
    │   │   ├── SourceAccToCanAccDefault.mfd
    │   │   └── SourceLocToCanLocDefault.mfd
    │   ├── TransformationFiles/
    │   │   ├── MappingMapToCanAccDefaultA.xslt
    │   │   ├── MappingMapToCanLocDefaultA.xslt
    │   │   └── MappingMapToModelLocDefault.xslt
    │   └── ValidationFiles/
    │       ├── CanAccDefaultA.xsd
    │       ├── CanAccDefaultB.xsd
    │       ├── CanLocDefaultA.xsd
    │       ├── CanLocDefaultB.xsd
    │       ├── ModelLocDefault.xsd
    │       ├── SourceAccDefault.xsd
    │       └── SourceLocDefault.xsd
    ├── flamingo/
    │   └── generic_model/
    │       ├── Files/
    │       ├── MappingFiles/
    │       ├── SQLFiles/
    │       ├── TransformationFiles/
    │       └── ValidationFiles/
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
        │   └── ORG
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

    22 directories, 61 files
