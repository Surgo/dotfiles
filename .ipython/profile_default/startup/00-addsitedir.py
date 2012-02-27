import site
from os import environ
from os.path import join
from sys import version_info

if 'VIRTUAL_ENV' in environ:
    site.addsitedir(join(environ.get('VIRTUAL_ENV'),
            'lib',
            'site-packages'))
    site.addsitedir(join(environ.get('VIRTUAL_ENV'),
            'lib',
            'python%d.%d' % version_info[:2],
            'site-packages'))
    print 'Env =>', environ.get('VIRTUAL_ENV')
    del site, environ, join, version_info
