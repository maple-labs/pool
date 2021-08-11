#!/usr/bin/env bash
set -e

while getopts v: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
    esac
done

echo $version

./build.sh -c ./config/prod.json

rm -rf ./package
mkdir -p package

echo "{
  \"name\": \"@maplelabs/pool\",
  \"version\": \"${version}\",
  \"description\": \"Pool Artifacts and ABIs\",
  \"author\": \"Maple Labs\",
  \"license\": \"AGPLv3\",
  \"repository\": {
    \"type\": \"git\",
    \"url\": \"https://github.com/maple-labs/pool.git\"
  },
  \"bugs\": {
    \"url\": \"https://github.com/maple-labs/pool/issues\"
  },
  \"homepage\": \"https://github.com/maple-labs/pool\"
}" > package/package.json

mkdir -p package/artifacts
mkdir -p package/abis

cat ./out/dapp.sol.json | jq '.contracts | ."contracts/PoolFactory.sol" | .PoolFactory' > package/artifacts/PoolFactory.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/PoolFactory.sol" | .PoolFactory | .abi' > package/abis/PoolFactory.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/Pool.sol" | .Pool' > package/artifacts/Pool.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/Pool.sol" | .Pool | .abi' > package/abis/Pool.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/libraries/PoolLib.sol" | .PoolLib' > package/artifacts/PoolLib.json
cat ./out/dapp.sol.json | jq '.contracts | ."contracts/libraries/PoolLib.sol" | .PoolLib | .abi' > package/abis/PoolLib.json

npm publish ./package --access public

rm -rf ./package
