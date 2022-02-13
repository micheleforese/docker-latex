# Image: micheleforese/latex

## Build Image

```console
export LATEX_VERSION=2021
docker build \
  -t micheleforese/latex:$LATEX_VERSION-basic \
  -f Dockerfile.basic \
  .
```

```console
export LATEX_VERSION=2021
docker build \
  -t micheleforese/latex:$LATEX_VERSION-full \
  -f Dockerfile.full \
  .
```

## Publish Image

```console
docker push
```

## Execute Container

```sh
docker run \
  --rm -it --user $(id -u):$(id -g) -v "$(pwd -W)":/data \
  micheleforese/latex:full
```
