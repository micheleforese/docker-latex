# Image: micheleforese/latex

## Build Image

```sh
export LATEX_VERSION=2021
sudo docker build \\
  -t micheleforese/latex:$LATEX_VERSION-basic \\
  --build-arg LATEX_VERSION \\
  ./Dockerfile.basic
```

```sh
sudo docker build \\
  -t micheleforese/latex:$LATEX_VERSION-full
  ./Dockerfile.full
```

## Execute Container

```sh
docker run \\
  --rm -it --user $(id -u):$(id -g) -v "$(pwd -W)":/src \\
  micheleforese/latex:full
```
