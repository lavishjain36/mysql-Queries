Microsoft Windows [Version 10.0.19044.1586]
(c) Microsoft Corporation. All rights reserved.

C:\Users\hp>mysql -u root -p
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database mydb;
Query OK, 1 row affected (0.02 sec)

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| guvi               |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
7 rows in set (0.04 sec)

mysql> use mydb;
Database changed
mysql> show tables;
Empty set (0.02 sec)

mysql> create table mytable
    -> (
    -> id int unsigned not null auto_increment,
    -> username varchar(100) not null,
    -> email varchar(100) not null,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| mytable        |
+----------------+
1 row in set (0.01 sec)

mysql> insert into mytable(username,email) values("admin","admin123@gmail.com");
Query OK, 1 row affected (0.02 sec)

mysql> insert into mytable(username,email) values('Test','Test@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from mytable;
+----+----------+--------------------+
| id | username | email              |
+----+----------+--------------------+
|  1 | admin    | admin123@gmail.com |
|  2 | Test     | Test@gmail.com     |
+----+----------+--------------------+
2 rows in set (0.01 sec)

mysql> update mytable set username="Testnew" where id=2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from mytable;
+----+----------+--------------------+
| id | username | email              |
+----+----------+--------------------+
|  1 | admin    | admin123@gmail.com |
|  2 | Testnew  | Test@gmail.com     |
+----+----------+--------------------+
2 rows in set (0.01 sec)

mysql> delete from mytable where id=2;
Query OK, 1 row affected (0.01 sec)

mysql> select * from mytable;
+----+----------+--------------------+
| id | username | email              |
+----+----------+--------------------+
|  1 | admin    | admin123@gmail.com |
+----+----------+--------------------+
1 row in set (0.00 sec)

mysql> describe mydb.mytable;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int unsigned | NO   | PRI | NULL    | auto_increment |
| username | varchar(100) | NO   |     | NULL    |                |
| email    | varchar(100) | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
3 rows in set (0.02 sec)

mysql> select username from mytable;
+----------+
| username |
+----------+
| admin    |
+----------+
1 row in set (0.00 sec)

mysql> use mydb;
Database changed
mysql> create table car(
    -> car_id int unsigned not null primary key,
    -> name varchar(20),
    -> price decimal(8,2)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| car            |
| mytable        |
+----------------+
2 rows in set (0.01 sec)

mysql> insert into car(car_id,name,price) values(1,"Audi A1",'300000');
Query OK, 1 row affected (0.02 sec)

mysql> insert into car(car_id,name,price) values(2,"Audi A1",'500000');
Query OK, 1 row affected (0.01 sec)

mysql> insert into car(car_id,name,price) values(2,"Audi A2",'780000');
ERROR 1062 (23000): Duplicate entry '2' for key 'car.PRIMARY'
mysql> insert into car(car_id,name,price) values(3,"Audi A2",'780000');
Query OK, 1 row affected (0.01 sec)

mysql> insert into car(car_id,name,price) values(4,"Audi A2",'780000');
Query OK, 1 row affected (0.01 sec)

mysql> select * from car;
+--------+---------+-----------+
| car_id | name    | price     |
+--------+---------+-----------+
|      1 | Audi A1 | 300000.00 |
|      2 | Audi A1 | 500000.00 |
|      3 | Audi A2 | 780000.00 |
|      4 | Audi A2 | 780000.00 |
+--------+---------+-----------+
4 rows in set (0.00 sec)

mysql> select distinct name,price from car;
+---------+-----------+
| name    | price     |
+---------+-----------+
| Audi A1 | 300000.00 |
| Audi A1 | 500000.00 |
| Audi A2 | 780000.00 |
+---------+-----------+
3 rows in set (0.00 sec)

mysql> select * from car;
+--------+---------+-----------+
| car_id | name    | price     |
+--------+---------+-----------+
|      1 | Audi A1 | 300000.00 |
|      2 | Audi A1 | 500000.00 |
|      3 | Audi A2 | 780000.00 |
|      4 | Audi A2 | 780000.00 |
+--------+---------+-----------+
4 rows in set (0.00 sec)

mysql> select name from car;
+---------+
| name    |
+---------+
| Audi A1 |
| Audi A1 |
| Audi A2 |
| Audi A2 |
+---------+
4 rows in set (0.00 sec)

mysql> create table stack
    -> ( id int auto_increment primary key,
    -> username varchar(100) not null
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> insert into  stack(username) values ('admin'),('k admin'),('a adm b'),('adm now'),('not hjk');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from stack;
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
|  5 | not hjk  |
+----+----------+
5 rows in set (0.01 sec)

mysql> select * from stack where username like '%adm%';
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
+----+----------+
4 rows in set (0.01 sec)

mysql> select * from stack where username like 'adm%';
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  4 | adm now  |
+----+----------+
2 rows in set (0.00 sec)

mysql> select * from stack where username like '%adm';
Empty set (0.00 sec)

mysql> insert into  stack(username) values ('adm');
Query OK, 1 row affected (0.01 sec)

mysql> select * from stack;
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
|  5 | not hjk  |
|  6 | adm      |
+----+----------+
6 rows in set (0.00 sec)

mysql> select * from stack where username like '%adm%';
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
|  6 | adm      |
+----+----------+
5 rows in set (0.00 sec)

mysql> select * from stack where username like '%adm';
+----+----------+
| id | username |
+----+----------+
|  6 | adm      |
+----+----------+
1 row in set (0.00 sec)

mysql> select * from stack where id>=2 and id<=4;
+----+----------+
| id | username |
+----+----------+
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
+----+----------+
3 rows in set (0.00 sec)

mysql> select * from stack where id between 2 and 4;
+----+----------+
| id | username |
+----+----------+
|  2 | k admin  |
|  3 | a adm b  |
|  4 | adm now  |
+----+----------+
3 rows in set (0.00 sec)

mysql> select * from stack where id not between 2 and 4;
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
|  5 | not hjk  |
|  6 | adm      |
+----+----------+
3 rows in set (0.00 sec)

mysql> select * from stack where username="admin";
+----+----------+
| id | username |
+----+----------+
|  1 | admin    |
+----+----------+
1 row in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| guvi               |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
7 rows in set (0.01 sec)

mysql> create database kv;
Query OK, 1 row affected (0.02 sec)

mysql> use kv;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> create table student1
    -> (rollno integer,
    -> name char(10),
    -> class ineteger,
    -> ^C
mysql> create table student1
    -> (rollno integer,
    -> name char(10),
    -> class integer,
    -> marks integer);
Query OK, 0 rows affected (0.07 sec)

mysql> create table student2
    -> (rollno integer,
    -> name char(10),
    -> class integer,
    -> marks integer);
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+--------------+
| Tables_in_kv |
+--------------+
| student1     |
| student2     |
+--------------+
2 rows in set (0.01 sec)

mysql> insert into student1
    -> values(101,"Sindu",31,80),
    -> (102,"Syed",31,75),
    -> (103,"jacky",31,90),
    -> (104,"John",31,80),
    -> (105,"jenny",31,99),
    -> (106,"maneesh",31,85);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from student1;
+--------+---------+-------+-------+
| rollno | name    | class | marks |
+--------+---------+-------+-------+
|    101 | Sindu   |    31 |    80 |
|    102 | Syed    |    31 |    75 |
|    103 | jacky   |    31 |    90 |
|    104 | John    |    31 |    80 |
|    105 | jenny   |    31 |    99 |
|    106 | maneesh |    31 |    85 |
+--------+---------+-------+-------+
6 rows in set (0.01 sec)

mysql> insert into student2
    -> select rollno,name,class,marks from student1;
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from student2;
+--------+---------+-------+-------+
| rollno | name    | class | marks |
+--------+---------+-------+-------+
|    101 | Sindu   |    31 |    80 |
|    102 | Syed    |    31 |    75 |
|    103 | jacky   |    31 |    90 |
|    104 | John    |    31 |    80 |
|    105 | jenny   |    31 |    99 |
|    106 | maneesh |    31 |    85 |
+--------+---------+-------+-------+
6 rows in set (0.00 sec)

mysql> create table student3;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table student3
    ->  -> (rollno integer,
    ->     -> name char(10),
    ->     -> class integer,
    ->     -> marks integer);^Z
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> (rollno integer,
    -> name char(10),
    -> class integer,
    -> marks int' at line 2
    -> ^C
mysql>
mysql> create table student3
    -> (rollno integer,
    -> name char(10),
    -> class integer,
    -> marks integer);
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+--------------+
| Tables_in_kv |
+--------------+
| student1     |
| student2     |
| student3     |
+--------------+
3 rows in set (0.01 sec)

mysql> insert into student3
    -> select rollno,name,class  from student2;
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into student3
    -> select rollno,name,class,marks from student2;
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from student3;
+--------+---------+-------+-------+
| rollno | name    | class | marks |
+--------+---------+-------+-------+
|    101 | Sindu   |    31 |    80 |
|    102 | Syed    |    31 |    75 |
|    103 | jacky   |    31 |    90 |
|    104 | John    |    31 |    80 |
|    105 | jenny   |    31 |    99 |
|    106 | maneesh |    31 |    85 |
+--------+---------+-------+-------+
6 rows in set (0.01 sec)

mysql> update student3 set rollno=107 where rollno=106;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student3;
+--------+---------+-------+-------+
| rollno | name    | class | marks |
+--------+---------+-------+-------+
|    101 | Sindu   |    31 |    80 |
|    102 | Syed    |    31 |    75 |
|    103 | jacky   |    31 |    90 |
|    104 | John    |    31 |    80 |
|    105 | jenny   |    31 |    99 |
|    107 | maneesh |    31 |    85 |
+--------+---------+-------+-------+
6 rows in set (0.00 sec)

mysql> delete from student3 where rollno>103;
Query OK, 3 rows affected (0.01 sec)

mysql> select * from student3;
+--------+-------+-------+-------+
| rollno | name  | class | marks |
+--------+-------+-------+-------+
|    101 | Sindu |    31 |    80 |
|    102 | Syed  |    31 |    75 |
|    103 | jacky |    31 |    90 |
+--------+-------+-------+-------+
3 rows in set (0.01 sec)

mysql> drop table student3;
Query OK, 0 rows affected (0.10 sec)

mysql> select * from student3;
ERROR 1146 (42S02): Table 'kv.student3' doesn't exist
mysql>
