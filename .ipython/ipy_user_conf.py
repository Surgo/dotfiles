# See http://ipython.scipy.org/moin/IpythonExtensionApi

import IPython.ipapi
ip = IPython.ipapi.get()

import os


def import_all(modules):
    for m in modules.split():
        ip.ex("from %s import *" % m)


def execf(fname):
    ip.ex('execfile("%s")' % os.path.expanduser(fname))


def main():
    o = ip.options
    o.system_verbose = 0

    import_all("os sys")
    execf('~/.ipython/virtualenv.py')


main()
