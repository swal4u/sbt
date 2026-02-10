# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.


## Get started

- Clone the project

```bash
git clone https://github.com/swal4u/sbt.git
```

- then build the image

```bash
cd sbt
docker build -t sbt .
```

## How to use this Docker image

- Go in the root folder where you have your build.sbt
- Launch the container to compile your Scala project

```bash
docker run -it --rm -v $PWD:/app sbt [compile]
```

- Launch the container to test your Scala project
```bash
docker run -it --rm -v $PWD:/app sbt test
```

### Deep dive

- This image is based on hardened docker image Eclipse Temurin JDK 21.
- This image includes Scala 2.13.18 and SBT.
- I use sdkman to install sbt and scala.
- I use multi-stage Docker builds to optimize the image size.
- I have a default scala project to put in cache the dependencies and compiled artifacts like spark, kafka. If you want to update the dependencies, you need to modify the build.sbt file and rebuild the image.

### Alias

Don't forget to create alias on your machine to simplify the usage of this container.


