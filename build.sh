version=$(curl https://raw.githubusercontent.com/screeps/screeps/isolated-vm/package.json | jq -r .version)
git clone git@github.com:ags131/docker-screeps-server -b beta
pushd docker-screeps-server
sed -i 's/^ENV SCREEPS_VERSION.*$/ENV SCREEPS_VERSION '$version'/i' Dockerfile
git commit -a -m "Auto Update to screeps "$version
git push origin beta --tags
bash
popd
rm -rf docker-screeps-server
