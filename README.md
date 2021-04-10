# mbigras/app

> App is a test application for experimenting with Application Delivery.

## Overview

This app is for experimenting with Application Delivery workflows.

## Example

1. Start a Docker container from the `mbigras/app` Docker image.

   ```
   docker run -it -e PORT=8080 -p 8080:8080 mbigras/app
   ```

1. Open a new terminal
1. Issue a GET request

   ```
   curl localhost:8080/foo/bar?baz=bat
   ```

   The output should look something like this:

   ```
   host: e41dd797a91d full_path: /foo/bar?baz=bat
   ```

1. Stop the container by pressing Control - C
