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
   $ curl localhost:8080/foo/bar?baz=bat
   {
     "app": "app1",
     "env": "prod",
     "tag": "b46edb54bb829b892e19dc72a640db45b0521a1f",
     "features": [
       "feature1"
     ],
     "path": "foo/bar",
     "params": {
       "baz": "bat"
     }
   }
   ```

1. Stop the container by pressing Control - C.
