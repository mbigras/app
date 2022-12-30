# mbigras/app

> App is a test application for experimenting with application delivery workflows.

## Overview

This app is for experimenting with application delivery workflows.

## Resources

See the following relevant resources.

* https://www.hashicorp.com/resources/application-delivery-hashicorp
* https://githubflow.github.io/

## Getting started

1. Run an `mbigras/app` Docker container.

   ```
   docker run --rm -it -e APP=app1 -e ENV=prod -e PORT=8080 -p 8080:8080 mbigras/app
   ```

1. Open a new terminal
1. Issue a GET request

   ```
   curl localhost:8080/foo/bar?baz=bat
   ```

   The output should look like the following.

   ```
   $ curl localhost:8080/foo?bar=bar
   {
     "app": "app1",
     "tag": "21b5997d22bac3324532aaea074db3c9108c2535",
     "env": "prod",
     "owner": "unset",
     "features": "unset",
     "speed": "unset",
     "reliability": "unset",
     "host": "63cc1f7a05c5",
     "path": "foo",
     "params": {
       "bar": "bar"
     }
   }
   ```

1. Stop the container by pressing Control - C.
