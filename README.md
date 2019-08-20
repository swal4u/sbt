# How to work with the container SBT

You must have a directory "app" at the root of your project.
When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Build the container

```bash
docker build -t swal4u/sbt:v0.13.17.8 .
```

## Start the container with the default command

```bash
docker run --rm -v $PWD:/app -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:v0.13.17.8
```

## Start the container with another command

```bash
docker run --rm -v $PWD:/app -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:v0.13.17.8 sbt compile
```
