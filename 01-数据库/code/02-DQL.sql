SELECT * FROM stu;

-- 条件查询 =====================

-- 1.查询年龄大于20岁的学员信息
select * from stu where age > 20;


-- 2.查询年龄大于等于20岁的学员信息
select * from stu where age >= 20;


-- 3.查询年龄大于等于20岁 并且 年龄 小于等于 30岁 的学员信息
select * from stu where age >= 20 &&  age <= 30;
select * from stu where age >= 20 and  age <= 30;

select * from stu where age BETWEEN 20 and 30;

-- 4.查询入学日期在'1998-09-01' 到 '1999-09-01'  之间的学员信息

select * from stu where hire_date BETWEEN '1998-09-01' and '1999-09-01';


-- 5. 查询年龄等于18岁的学员信息

select * from stu where age = 18;

-- 6. 查询年龄不等于18岁的学员信息
select * from stu where age != 18;

select * from stu where age <> 18;

-- 7. 查询年龄等于18岁 或者 年龄等于20岁 或者 年龄等于22岁的学员信息
select * from stu where age = 18 or age = 20 or age = 22;
select * from stu where age in (18,20 ,22);

-- 8. 查询英语成绩为 null的学员信息  
-- 注意： null值的比较不能使用 = != 。需要使用 is  is not
 
select * from stu where english = null; -- 不行的

select * from stu where english is null;

select * from stu where english is not null;


-- 模糊查询 like =====================
/*
	通配符：
	 (1)_:代表单个任意字符
	 (2)%:代表任意个数字符
*/

-- 1. 查询姓'马'的学员信息

select * from stu where name like '马%';

-- 2. 查询第二个字是'花'的学员信息   

select * from stu where name like '_花%';

-- 3. 查询名字中包含 '德' 的学员信息

select * from stu where name like '%德%';

/*
	排序查询：
		* 语法：SELECT 字段列表 FROM 表名  ORDER BY 排序字段名1 [排序方式1],排序字段名2 [排序方式2] …;
		* 排序方式：
				* ASC：升序排列（默认值）
				* DESC：降序排列
*/

-- 1.查询学生信息，按照年龄升序排列 

select * from stu order by age ;

-- 2.查询学生信息，按照数学成绩降序排列

select * from stu order by math desc ;

-- 3.查询学生信息，按照数学成绩降序排列，如果数学成绩一样，再按照英语成绩升序排列

select * from stu order by math desc , english asc ;


/*
	分组函数
			SELECT 字段列表 FROM 表名 [WHERE 分组前条件限定] GROUP BY 分组字段名 [HAVING 分组后条件过滤]…;
*/
select * from stu ;
-- 1. 查询男同学和女同学各自的数学平均分

select sex, avg(math) from stu group by sex;

-- 注意：分组之后，查询的字段为聚合函数和分组字段，查询其他字段无任何意义
select name, sex, avg(math) from stu group by sex;

-- 2. 查询男同学和女同学各自的数学平均分，以及各自人数

select sex, avg(math),count(*) from stu group by sex;

-- 3. 查询男同学和女同学各自的数学平均分，以及各自人数，要求：分数低于70分的不参与分组

select sex, avg(math),count(*) from stu where math > 70 group by sex;

-- 4. 查询男同学和女同学各自的数学平均分，以及各自人数，要求：分数低于70分的不参与分组，分组之后人数大于2个的。

select sex, avg(math),count(*) from stu where math > 70 group by sex having count(*)  > 2;


/*
	分页查询:

			SELECT 字段列表 FROM 表名 LIMIT  起始索引 , 查询条目数
				* 起始索引：从0开始

*/
select * from stu ;
-- 1. 从0开始查询，查询3条数据
select * from stu limit 0 , 3;


-- 2. 每页显示3条数据，查询第1页数据
select * from stu limit 0 , 3;
-- 3. 每页显示3条数据，查询第2页数据
select * from stu limit 3 , 3;
-- 4. 每页显示3条数据，查询第3页数据

select * from stu limit 6 , 3;

-- 起始索引 = （当前页码 - 1） * 每页显示的条数























