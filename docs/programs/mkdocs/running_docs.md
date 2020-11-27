## Installation

we use [mkdocs](https://www.mkdocs.org) as main platform:
```
pip install mkdocs
```

and [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) as theme:
```
pip install mkdocs-material
```

## Running

=== "serve"
    ```
    mkdocs serve
    ```
=== "custom port"
    ```
    mkdocs serve -a localhost:8001
    ```

## Building
```
mkdocs build --clean
```