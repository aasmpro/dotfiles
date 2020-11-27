# mysql and mariadb configs
### show all users
```
select User, Host from mysql.user;
```

### grant prvilages to a user
```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
```

### clear sql mode
```
set session sql_mode = '';
set global sql_mode = '';
```
