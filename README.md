# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Get started (Simple version - run container as root)

You have just to launch this command.

```bash
docker run --rm -v $PWD:/app -v ivy2:/app/.ivy2 -v sbt:/app/.sbt --name sbt swal4u/sbt:v1.3.7.3
```

## Advanced users

If you want to work with a more secure container or if you want to use docker in vagrant in windows, you have to build the container before running.
This version create an user (name: docker) inside the container with the uid as your host user. So it will possible to share folder in vagrant for example.

First, you have to download or clone this repo.

```bash
git clone git@github.com:swal4u/sbt.git
```

Second, you have to build the container.

```bash
docker build -t swal4u/sbt --build-arg USER_ID=$(id -u) .
```

Third, you can run the container. I change also the system for cache folders to avoid the download of dependencies on each project.

```bash
docker run --rm -it -p 9000:9000 -v $PWD:/app -v ivy2:/home/docker/.ivy2 -v sbt:/home/docker/.sbt -v cache:/home/docker/.cache --name sbt swal4u/sbt sbt
```

### Alias

Don't forget to create alias on your machine to simplify the usage of this container.

### Publish (tip for me)

git tag -a -m "message" vX.Y.Z.T
git push --tags
