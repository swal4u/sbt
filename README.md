# How to work with the container SBT

You must have a directory "app" at the root of your project.
When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Start the container with the default command

```bash
docker run --rm -v $PWD:/root/ -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:version-0.13.17.5
```

## Start the container with another command

```bash
docker run --rm -v $PWD:/root/ -v ivy2:/root/.ivy2 -v sbt:/root/.sbt --name sbt swal4u/sbt:0.13.17 sbt compile
```
