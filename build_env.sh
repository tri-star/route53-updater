#/bin/bash

PY_VER=$(python -c 'import sys,re; match=re.match(r"^([0-9\.]{3})", sys.version); print match.group(1)')

echo "Copying System Python files..."
test -d ./bin || mkdir ./bin
test -L ./bin/python || cp -a /usr/bin/python ./bin/
test -L ./bin/python2 || cp -a /usr/bin/python2 ./bin/
test -L ./bin/python${PY_VER} || cp -a /usr/bin/python${PY_VER} ./bin/
test -d ./lib || mkdir ./lib
test -d ./lib64 || mkdir ./lib64
test -d ./include || mkdir ./include
test -d ./usr/lib/python${PY_VER} || cp -a /usr/lib/python${PY_VER} ./lib/
test -d ./usr/lib64/python${PY_VER} || cp -a /usr/lib64/python${PY_VER} ./lib64/
test -d ./usr/include/python${PY_VER} || cp -a /usr/include/python${PY_VER} ./include/

if [ ! -f ./bin/easy_install ]; then
    echo "Downloading setup tools..."
    curl -O https://pypi.python.org/packages/${PY_VER}/s/setuptools/setuptools-0.6c11-py${PY_VER}.egg
    PATH=./bin:$PATH bash setuptools-0.6c11-py${PY_VER}.egg
fi

echo "Installing Depedencies..."
bin/easy_install pip
bin/pip install ansible
bin/easy_install boto
bin/easy_install httplib2


