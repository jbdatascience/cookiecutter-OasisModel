#!/usr/bin/env python3

import os
import time

from subprocess import check_call

GIT_SUBMODULES = {
    'oasis_utils': 'git+ssh://git@github.com/OasisLMF/oasis_utils',
    'oasis_keys_lookup': 'git+ssh://git@github.com/OasisLMF/oasis_keys_lookup',
    'oasis_keys_server': 'git+ssh://git@github.com/OasisLMF/oasis_keys_server'
}


def create_git_repo():
    check_call(['git', 'init'])
    check_call(['git', 'add', '.'])
    check_call(['git', 'commit', '-m', 'Post-project creation initialisation'])

def add_git_submodules():
    for name, url in GIT_SUBMODULES.items():
        check_call(
            [
                'git', 'submodule', 'add', '-f', '{}'.format(url), os.path.join('src', name),
                'git', 'checkout', 'master'
            ]
        )

if __name__ == '__main__':
    print('\nCreating Git repo in {}.\n'.format(os.getcwd()))
    time.sleep(2)
    create_git_repo()    
    print('\nAdding Git submodules in {}.\n'.format(os.path.join(os.getcwd(), 'src')))
    time.sleep(2)
    add_git_submodules()
