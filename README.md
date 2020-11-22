# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.
Note that I encountered problem with sbt 1.4.1 with rights on folder to work with gitlab CI/CD.

## Get started

You have just to launch this command.

```bash
docker run -it --rm -v $PWD:/app -w /app -v ivy2:/home/sbt/.cache --name sbt -e TZ=Europe/Paris swal4u/sbt:v1.3.7.x
```

### Alias

Don't forget to create alias on your machine to simplify the usage of this container.

### Publish (tip for me)

git tag -am "message" vX.Y.Z.T
git push --tags
git tag -d vX.Y.Z.T // if you want to delete local tag
git tag --delete origin vX.Y.Z.T // if you want to delete remote tag
