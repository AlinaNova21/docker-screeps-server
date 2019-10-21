version=$(curl https://raw.githubusercontent.com/screeps/screeps/master/package.json | jq -r .version)
git clone git@github.com:ags131/docker-screeps-server
pushd docker-screeps-server
if [[ "$1" == "ptr" ]]; then
	version=ptr
fi
sed -i 's/^ENV SCREEPS_VERSION.*$/ENV SCREEPS_VERSION '$version'/i' Dockerfile
date > timestamp
git add timestamp
git commit --no-gpg-sign -a -m "Auto Update to screeps "$version
git tag -f $version
if [[ "$version" != "ptr" ]]; then
	git tag -f latest
fi
git push origin master --tags --force
popd
rm -rf docker-screeps-server
