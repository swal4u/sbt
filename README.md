# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Build the container

```bash
docker build -t swal4u/sbt:v0.13.17.2 .
```

## Start the container with the default command

```bash
docker run --rm -v $PWD:/root -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:v0.13.17.2
```

## Start the container with another command

```bash
docker run --rm -v $PWD:/root -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:v0.13.17.2 sbt compile
```

### Alias

Des alias ont été mis en place pour en simplifier l'usage.

### Publication du container

git tag -a -m vX.Y.Z.T
