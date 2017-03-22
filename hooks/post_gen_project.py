#!/usr/bin/env python2.7

import os

from subprocess import check_call

GIT_SUBMODULES = {
    'oasis_utils': 'https://github.com/OasisLMF/oasis_utils',
    'oasis_keys_server': 'https://github.com/OasisLMF/oasis_keys_server'
}

BASE_DIR = os.getcwd()
SUBMODULE_TARGET_DIR = os.path.join(BASE_DIR, 'src')

def create_git_repo():
	print 'Creating Git repo in {}'.format(BASE_DIR)
	check_call(['git', 'init'])
	check_call(['git', 'add', '.'])
	check_call(['git', 'commit', '-m', 'Post-project creation initialisation'])

def add_git_submodules():
	print 'Creating submodules in {}'.format(SUBMODULE_TARGET_DIR)
	for name, url in GIT_SUBMODULES.iteritems():
	    check_call(['git', 'submodule', 'add', '-f', '{}'.format(url), '{}'.format(os.path.join(SUBMODULE_TARGET_DIR, name))])
	    check_call(['cd', os.path.join(SUBMODULE_TARGET_DIR, name)])
	    check_call(['git', 'checkout', 'master'])

if __name__ == '__main__':
	create_git_repo()
    add_git_submodules()

