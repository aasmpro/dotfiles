!!! info "these exapmles are useful for Django migrations"

find all python files starting with `00` and deleting them
```
find . -iname "00*.py" -delete
```
find by address and exclude a folder
```
find . -iwholename "*/migrations/00*.py" -not -path "*_env*" -delete
```