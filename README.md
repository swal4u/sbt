# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Build the container

### Default build (as root)

```bash
docker build -t swal4u/sbt:v1.3.7.5 --build-arg USER_ID=0 --build-arg GROUP_ID=0 .
```

### Specific build (if you use vagrant)

```bash
docker build -t swal4u/sbt --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
```

## Start the container with the default command

```bash
docker run --rm -it -p 9000:9000 -v $PWD:/app -v ivy2:/var/.ivy2 -v sbt:/var/.sbt --name sbt swal4u/sbt
```

### Alias

Des alias ont été mis en place pour en simplifier l'usage.

### Publication du container

git tag -a -m "message" vX.Y.Z.T
git push --tags
