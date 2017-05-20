{{cookiecutter.organization}} {{cookiecutter.model_identifier.upper()}} Model README
====================================================================================

To clone this repository first ensure that you have generated an SSH key pair on your local machine and add the public key of that pair to your GitHub account. Then run

    git clone --recursive git+ssh://git@github.com/OasisLMF/<repo name>

This will create a folder named `<repo name>`. The main body of the Python code is located in the `src` subfolder, and is structured in four subpackages:

* `keys_server`: model-specific lookup logic; multiple models each have their own lookup class, extending the Oasis base keys lookup class, in an appropriately named module; a stub class `{{cookiecutter.model_identifier.upper()}}KeysLookup` has been provided in the module `{{cookiecutter.model_identifier.upper()}}KeysLookup.py`
* `oasis_utils`: Oasis utilities for logging, data validation and conversion, lookup-related flags and constants, etc.
* `oasis_keys_lookup`: the Oasis base keys lookup class `BaseKeysLookup` which serves as a template for the model-specific lookup classes
* `oasis_keys_server`: the Oasis Flask keys server
* `oasis_build_utils`: Oasis repo containing utilities for building and running keys server Docker images

Of these subpackages `oasis_utils`, `oasis_keys_lookup`, `oasis_keys_server` and `oasis_build_utils` are Oasis GitHub repositories which are contained in `<repo name>` as Git submodules - you cannot push changes to these repositories directly.

After the cloning, you may want to `cd` into `<repo name>` and run the command

    git submodule foreach 'git checkout master && git pull origin'

to ensure that these submodules are checked out on the master branches and are up-to-date with their upstream versions. 

Any upstream changes to the submodule repositories will be reflected locally if you choose to update the submodules from GitHub. In that case you should `cd` into the base of the repo and add those changes to the index and commit them.
