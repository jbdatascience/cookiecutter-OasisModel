#!/usr/bin/env python3

import os
import time

from subprocess import check_call

GIT_SUBMODULES = {
    'oasis_utils': 'https://github.com/OasisLMF/oasis_utils',
    'oasis_keys_server': 'https://github.com/OasisLMF/oasis_keys_server'
}


def create_git_repo():
    check_call(['git', 'init'])
    check_call(['git', 'add', '.'])
    check_call(['git', 'commit', '-m', 'Post-project creation initialisation'])

def add_git_submodules():
    for name, url in GIT_SUBMODULES.items():
        check_call(['git', 'submodule', 'add', '-f', '{}'.format(url), 'src/{}'.format(name)])
        check_call(['tree', '.'])
        #check_call(['git', 'checkout', 'master'])

if __name__ == '__main__':
    print('\nCreating Git repo in {}.\n'.format(os.getcwd()))
    create_git_repo()
    time.sleep(3)
    print('\nCreating submodules in {}.\n'.format(os.path.join(os.getcwd(), 'src')))
    add_git_submodules()
    time.sleep(1)

