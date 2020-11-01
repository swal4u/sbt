# How to work with the container SBT

When you start your container, it automatically starts the sbt package command.
If you want to start another command, you can override the default command.

## Get started

You have just to launch this command.

```bash
docker run -it --rm -v $PWD:/app --name sbt -e TZ=Europe/Paris swal4u/sbt:v1.4.1.0
```

### Alias

Don't forget to create alias on your machine to simplify the usage of this container.

### Publish (tip for me)

git tag -a -m "message" vX.Y.Z.T
git push --tags
