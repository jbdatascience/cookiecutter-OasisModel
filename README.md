# cookiecutter-OasisModel
A cookie cutter project structure for Oasis models that can be replicated using the <a href="https://pypi.python.org/pypi/cookiecutter" target="_blank">`cookiecutter` Python tool</a>:

    # Install the cookiecutter tool (if not present)
    pip install cookiecutter
    
    # Run cookiecutter
    cookiecutter https://github.com/OasisLMF/cookiecutter-OasisModel

The project structure is contained in the repo folder named <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D" target="_blank">`{{cookiecutter.project_slug}}`</a> and project-related settings such as the project descriptive name, model name and version etc. are configurable in the repo file <a href="https://github.com/OasisLMF/cookiecutter-OasisModel/blob/master/cookiecutter.json" target="_blank">`cookiecutter.json`</a> and set during runtime by prompts.

You should see the following project structure in the place where you ran the command:

    oasis_model/
    ├── Dockerfile.ORG_MODEL_keys_server
    ├── Dockerfile.ORG_MODEL_model_execution_worker
    ├── LICENSE
    ├── example_data
    │   ├── Exposures
    │   │   ├── CanAcc_PiWindP1.csv
    │   │   ├── CanAcc_PiWindP1_B.csv
    │   │   ├── CanLoc_PiWindP1.csv
    │   │   ├── CanLoc_PiWindP1_B.csv
    │   │   ├── ModelLoc_PiWind.csv
    │   │   ├── SourceAcc_PiWindP1.csv
    │   │   └── SourceLoc_PiWindP1.csv
    │   ├── MappingFiles
    │   │   ├── CanLocToModelLocDefault.mfd
    │   │   ├── SourceAccToCanAccDefault.mfd
    │   │   └── SourceLocToCanLocDefault.mfd
    │   ├── TransformationFiles
    │   │   ├── MappingMapToCanAccDefaultA.xslt
    │   │   ├── MappingMapToCanLocDefaultA.xslt
    │   │   └── MappingMapToModelLocDefault.xslt
    │   └── ValidationFiles
    │       ├── CanAccDefaultA.xsd
    │       ├── CanAccDefaultB.xsd
    │       ├── CanLocDefaultA.xsd
    │       ├── CanLocDefaultB.xsd
    │       ├── ModelLocDefault.xsd
    │       ├── SourceAccDefault.xsd
    │       └── SourceLocDefault.xsd
    ├── flamingo
    │   └── MEEQ
    │       ├── Files
    │       │   ├── TransformationFiles
    │       │   │   ├── MappingMapToCanAcc.xslt
    │       │   │   ├── MappingMapToCatrisks_CanLoc.xslt
    │       │   │   └── MappingMapToCatrisks_ModelLoc.xslt
    │       │   └── ValidationFiles
    │       │       ├── CanAcc.xsd
    │       │       ├── Catrisks_CanLoc.xsd
    │       │       ├── Catrisks_ModelLoc.xsd
    │       │       ├── Catrisks_SourceLoc.xsd
    │       │       └── SourceAcc.xsd
    │       ├── MappingFiles
    │       │   ├── cantomodel_meeq.mfd
    │       │   └── sourcetocan_meeq.mfd
    │       ├── SQLFiles
    │       │   ├── LoadModelData.sql
    │       │   └── load_catrisks_data.py
    │       ├── TransformationFiles
    │       │   ├── MappingMapToCanAcc.xslt
    │       │   ├── MappingMapToCatrisks_CanLoc.xslt
    │       │   └── MappingMapToCatrisks_ModelLoc.xslt
    │       └── ValidationFiles
    │           ├── CanAcc.xsd
    │           ├── Catrisks_CanLoc.xsd
    │           ├── Catrisks_ModelLoc.xsd
    │           ├── Catrisks_SourceLoc.xsd
    │           └── SourceAcc.xsd
    ├── keys_data
    ├── model_data
    └── src
        ├── keys_server
        │   ├── KeysLookup.py
        │   └── __init__.py
        └── model_execution_worker
            └── ORG
                ├── __init__.py
                └── supplier_model_runner.py

