{{cookiecutter.organization}} {{cookiecutter.model_identifier.upper()}} Model README
====================================================================================

To clone this repository first ensure that you have generated an SSH key pair on your local machine and add the public key of that pair to your GitHub account (there is a GitHub guide for this at https://help.github.com/articles/connecting-to-github-with-ssh/). Then run

    git clone --recursive git+ssh://git@github.com/OasisLMF/{{cookiecutter.project_slug.replace(' ', '')}}

The `--recursive` option ensures the cloned repository contains the necessary Oasis repositories <a href="https://github.com/OasisLMF/oasis_utils" target="_blank">`oasis_utils`</a>, <a href="https://github.com/OasisLMF/oasis_keys_lookup" target="_blank">`oasis_keys_lookup`</a>, <a href="https://github.com/OasisLMF/oasis_keys_server" target="_blank">`oasis_keys_server`</a> and <a href="https://github.com/OasisLMF/oasis_build_utils" target="_blank">`oasis_build_utils`</a> as Git submodules. You have read only access to these repositories.


After the clone `cd` into `{{cookiecutter.project_slug.replace(' ', '')}}` and run the following command

    git submodule foreach 'git checkout master'

to ensure that the Oasis submodules are checked out on the master branches. If you've already cloned the repository and wish to update the submodules from GitHub then run

    git submodule foreach 'git pull origin'

Any changes to the submodules, e.g. when pulled from GitHub, will be reflected locally when you run `git status -uno`. In that case you should add those changes to the Git index and commit them.



