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

    oasis_model/
    ├── Dockerfile.ORG_MODEL_keys_server
    ├── Dockerfile.ORG_MODEL_model_execution_worker
    ├── LICENSE
    ├── README.md
    ├── example_data/
    │   ├── Exposures/
    │   ├── MappingFiles/
    │   ├── TransformationFiles/
    │   └── ValidationFiles/
    ├── flamingo/
    │   └── MEEQ/
    ├── keys_data/
    ├── keys_server_config/
    │   ├── apache.conf
    │   ├── oasis.conf
    │   └── oasis.wsgi
    ├── model_data/
    │   └── data.csv
    └── src/
        ├── keys_server/
        ├── model_execution_worker/
        ├── oasis_keys_server/
        └── oasis_utils/
