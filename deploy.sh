#! /usr/bin/env nix-shell
#! nix-shell -i bash -p kustomize

set -euo pipefail

header() {
	echo "######################"
        echo "$@"
	echo "######################"
}

TAG="georgyo/mtapi-api-server:$(date +%Y%m%d%H%M)"


header TAG = ${TAG}

header Building Image
cat $(nix build  --print-out-paths ".#dockerImage") \
  | gzip --fast \
  | skopeo copy docker-archive:/dev/stdin "docker://docker.io/${TAG}"

header edit Kustomize
kustomize edit set image mtapi-api-server="${TAG}"


header Deploy
kubectl apply -k .
