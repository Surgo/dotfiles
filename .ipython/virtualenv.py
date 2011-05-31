import os
import sys
import site

if 'VIRTUAL_ENV' in os.environ:
    virtual_env_package_dir = os.path.join(
            os.environ.get('VIRTUAL_ENV'), 'lib', 'site-packages')
    site.addsitedir(virtual_env_package_dir)
    sys.stdout.write('virtualenv packages: %s\n' % virtual_env_package_dir)
    del virtual_env_package_dir
del os, sys, site
