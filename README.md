# clojure-workbench
Develop environment for Clojure project

## Usage
* Create `docker-compose.yml` in your project.

```
    lein: &defaults
      image: clojure-workbench
      volumes:
        - .:/usr/src/app
```

* Run lein command.

```
    $ docker-compose run --rm lein repl
```
