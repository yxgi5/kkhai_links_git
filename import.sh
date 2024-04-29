#!/bin/bash

#sqlite3 kkhai1.db < import.sql
: <<COMMENT
###import.sql###
drop table kkhai;
.read schema.sql
.mode csv
.separator |
.header off
.import list.csv kkhai
.exit
COMMENT


#sqlite3 kkhai1.db <<EOF
sqlite3 kkhai.db <<EOF
drop table if exists kkhai;
CREATE TABLE IF NOT EXISTS "kkhai" (
	"id"	INTEGER PRIMARY KEY,
	"catalog"	TEXT,
	"name"	TEXT,
	"packages"	INTEGER,
	"link"	TEXT,
	"baidudisk"	TEXT,
	"passwd"	TEXT,
	"update"	TEXT
);
.mode csv
.separator |
.header off
.import list.csv kkhai
.exit
EOF




#sqlitebrowser kkhai1.db
#mv kkhai1.db kkhai.db

