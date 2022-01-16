# Image: micheleforese/latex

```sh
export LATEX_VERSION=2021
sudo docker build -t micheleforese/latex:$LATEX_VERSION-basic --build-arg LATEX_VERSION ./Dockerfile.basic
sudo docker build -t micheleforese/latex:$LATEX_VERSION-full ./Dockerfile.full
```
