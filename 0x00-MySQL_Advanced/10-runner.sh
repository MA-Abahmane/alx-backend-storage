#!/usr/bin/env bash

cat 10-init.sql | mysql -uroot -p holberton
cat 10-div.sql | mysql -uroot -p holberton

echo "SELECT (a / b) FROM numbers;" | mysql -uroot -p holberton
echo "SELECT SafeDiv(a, b) FROM numbers;" | mysql -uroot -p holberton
