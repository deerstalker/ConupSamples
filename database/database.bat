echo 创建数据库
mysql -u root -p123456 <"createdatabase.sql"
echo 创建数据库jbpmds表
mysql jbpmds -uroot -p123456<"jbpmds.sql"
echo 创建数据库bpeltest表
mysql bpeltest -uroot -p123456<"bpeltest.sql"

