#!/bin/bash
#sqlite3 kkhai.db .schema > schema.sql
#sqlite3 kkhai.db < export.sql
: <<COMMENT
###export.sql###
.mode csv
.header off
.separator |
.out list.csv
select * from kkhai;
.exit
COMMENT

sqlite3 kkhai.db <<EOF
.mode csv
.header off
.separator |
.out list.csv
select * from kkhai;
.exit
EOF



