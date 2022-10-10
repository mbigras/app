# mbigras/app

> App is a test application for experimenting with [application delivery](https://www.hashicorp.com/resources/application-delivery-hashicorp) workflows.

## Overview

This app is for experimenting with application delivery workflows.

## Run app

1. Start a Docker container from the `mbigras/app` Docker image.

   ```
   docker run -it -e PORT=8080 -e ENV=prod -p 8080:8080 mbigras/app
   ```

1. Open a new terminal
1. Issue a GET request

   ```
   curl localhost:8080/foo/bar?baz=bat
   ```

   The output should look something like this:

   ```
   {"app":"app","env":"prod","params":{"baz":"bat"},"path":"foo/bar","version":"unset"}
   ```

1. Stop the container by pressing Control - C
