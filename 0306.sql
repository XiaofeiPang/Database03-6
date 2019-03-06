show databases ;
create database db_school;
show tables from db_school;
#学生表
create table db_school.student(
  -- 字段名 数据类型 [数据范围] [约束] 注释,
  sno varchar(255) primary key comment '学号',
  name varchar(20)not null comment '学生姓名',
  age int(2) comment '年龄',
  height double(3,2) not null comment '身高',
  dob date comment '出生年月日'
)comment '学生表';
insert into db_school.student value ('001','Tom', 19,1.80,'2000-3-6');
insert into db_school.student value ('002','jerry', 18,1.70,'2001-3-6');
insert into db_school.student value ('003','Mary', 20,1.60,'1999-3-6');
select * from db_school.student;
drop table db_school.student;
-- 课程表
create table db_school.course(
  cno varchar(40)primary key comment'课程号',
  cname varchar(255)not null comment'课程名',
  credit int(20) unique comment'学分'
)comment '课程表';
insert into db_school.course value('101','数据结构',3);
insert into db_school.course value('102','数据库',2);
insert into db_school.course value('103','计算机网络',5);
select * from db_school.course;
drop table db_school.course;
-- 选课表
create table db_school.sc(
  sno varchar(255) comment'学号',
  cno varchar(40) comment'课程号',
  grade double(4,2)comment'分数',
primary key(sno,cno),
foreign key (sno)references db_school.student(sno),
  foreign key (cno)references db_school.course(cno)
)comment'选课表';
insert into db_school.sc value('001','101',70.00);
insert into db_school.sc value('002','102',90.40);
insert into db_school.sc value('003','103',80.67);
select*from db_school.sc;
drop table db_school.sc;
select a.sno,cname,grade from db_school.student as a,db_school.course b,db_school.sc c
where a.sno=c.sno and b.cno=c.cno and grade>80;

