# Build alpine-darkhttpd Docker

The Dockerfile also includes build hooks to generate stand-alone images. See usage.

## Usage

The __darkhttpd__ Dockerfile is based on stock __Alpine Linux__ and can be run with a linked www source directory, or used as a base to embed the source content into a new image.

### base

You can pull the base image and link a `www` directory to it directly.

```bash
docker run -d -P -v /my/www/source:/home/www darkhttpd:base
```

### "compiled" source

You can 'compile' your `www` source into a new self-contained image. You do not need to run this image with a `www` directory.

__Create a new Dockerfile__

```bash
# Dockerfile
# Use darkhttpd:base to build
# the self-contained image.
FROM darkhttpd:base
```

___Save it up, that's all you need in this file.___

Make sure to place your `www` source folder in the same directory as the Dockerfile you just created.

```bash
docker build -t mywebsrv:v1 . #note the dot
```

You should end up with a new image called `mywebsrv:v1` which contains the `www` source that was supplied.

```bash
docker run -d -P mywebsrv:v1
```

You won't need the `www` source for this image.
