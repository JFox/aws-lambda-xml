#!/bin/sh

version=4.2.4

rm -rf "$version"
mkdir -p "$version"/py{27,36}

docker run -v $(pwd)/"$version/py27/":/outputs -it lambci/lambda:build-python2.7 pip install lxml=="$version" -t /outputs/
docker run -v $(pwd)/"$version/py36/":/outputs -it lambci/lambda:build-python3.6 pip install lxml=="$version" -t /outputs/

tar -czvf "$version/py36/lxml-4.2.4.tgz" "$version/py36/lxml"
tar -czvf "$version/py27/lxml-4.2.4.tgz" "$version/py27/lxml"
