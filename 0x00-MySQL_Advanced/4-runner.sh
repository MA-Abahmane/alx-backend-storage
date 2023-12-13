#!/usr/bin/env bash

cat 4-init.sql | mysql -uroot -p holberton 
cat 4-store.sql | mysql -uroot -p holberton 
cat 4-main.sql | mysql -uroot -p holberton 
