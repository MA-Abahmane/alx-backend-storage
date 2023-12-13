#!/usr/bin/env bash

cat 5-init.sql | mysql -uroot -p holberton 
cat 5-valid_email.sql | mysql -uroot -p holberton 
cat 5-main.sql | mysql -uroot -p holberton 
