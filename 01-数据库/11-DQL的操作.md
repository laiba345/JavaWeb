DQL的操作
- 对数据库中的表格进行查询操作；

1. 查询语法
```
SELECT
    字段列表
FROM
    表名列表
WHERE
    条件列表
GROUP BY
    分组字段
HAVING
    分组后条件
ORDER BY
    排序字段
LIMIT
    分页限定
```
2. 查询分类
- 基础查询
- 条件查询(WHERE)
- 分组查询(GROUP BY)
- 排序查询(ORDER BY)
- 分页查询(LIMIT)

3. 基础查询； 大部分公司不用星号
- 查询多个字段
    - SELECT 字段列表 FROM 表名;
    - SELECT * FROM 表名; -- 查询所有数据
- 去除重复记录
    - SELECT DISTINCT 字段列表 FROM 表名; 
- 起别名
    - AS: AS 也可以省略
    - select name, math 数学成绩, english as 英语成绩 from stu; 

4. 条件查询
- 语法
    - SELECT 字段列表 FROM 表名 WHERE 条件列表;
- 条件查询练习
    - 查询年龄大于20岁的学员信息
        - select * from stu where age > 20;
    - 查询年龄大于等于20岁的学员信息
        - select * from stu where age >= 20;
    - 查询年龄大于等于20岁 并且 年龄 小于等于 30岁 的学员信息
        - select * from stu where age >= 20 && age <= 30;
        - select * from stu where age >= 20 and age <= 30;
        - select * from stu where age BETWEEN 20 and 30;
    - 查询入学日期在'1998-09-01' 到 '1999-09-01' 之间的学员信息
        - select * from stu where hire_date BETWEEN '1998-09-01' and '1999-09-01';
    - 查询年龄等于18岁的学员信息
        - select * from stu where age = 18;
    - 查询年龄不等于18岁的学员信息
        - select * from stu where age != 18;
        - select * from stu where age <> 18;     
    - 查询年龄等于18岁 或者 年龄等于20岁 或者 年龄等于22岁的学员信息
        - select * from stu where age = 18 or age = 20 or age = 22;
        - select * from stu where age in (18,20 ,22); 
    - 查询英语成绩为 null的学员信息； **null值的比较不能使用 = 或者 != 。需要使用 is 或者 is not**
        - select * from stu where english = null; -- 这个语句是不行的
        - select * from stu where english is null;
        - select * from stu where english is not null;

5. 模糊查询
- 模糊查询使用like关键字，可以使用通配符进行占位:
    - （1）_ : 代表单个任意字符
    - （2）% : 代表任意个数字符
- 相关练习
    - 查询姓'马'的学员信息
        - select * from stu where name like '马%'; 
    - 查询第二个字是'花'的学员信息
        - select * from stu where name like '_花%';
    - 查询名字中包含 '德' 的学员信息 (最为常见)
        - select * from stu where name like '%德%';

6. 排序查询
- 语法
    - SELECT 字段列表 FROM 表名 ORDER BY 排序字段名1 [排序方式1],排序字段名2 [排序方式2] …;
- 排序方式
    - ASC ： 升序排列 （默认值）
    - DESC ： 降序排列
- 注意：**如果有多个排序条件，当前边的条件值一样时，才会根据第二条件进行排序**
- 练习；
    - 查询学生信息，按照年龄升序排列
        - select * from stu order by age ; 
    - 查询学生信息，按照数学成绩降序排列
        - select * from stu order by math desc ;
    - 查询学生信息，按照数学成绩降序排列，如果数学成绩一样，再按照英语成绩升序排列
        - select * from stu order by math desc , english asc;

7. 聚合函数查询
- 将一列数据作为一个整体，进行纵向计算
    - 例:现有一需求让我们求表中所有数据的数学成绩的总和。这就是对math字段进行纵向求和。
- 聚合函数的分类
        函数名      功能
        count(列名) 统计数量（一般选用不为null的列）
            - 1、主键
            - 2、*
        max(列名)   最大值
        min(列名)   最小值
        sum(列名)   求和
        avg(列名)   平均值
- 聚合函数的语法
    - SELECT 聚合函数名(列名) FROM 表;
    - 注意：null值不参与所有聚合函数运算
- 练习
    - 统计班级一共有多少个学生
        - select count(id) from stu;
        - select count(english) from stu;
            - 上面语句根据某个字段进行统计，如果该字段某一行的值为null的话，将不会被统计。所以可以在count(*) 来实现。* 表
            示所有字段数据，一行中也不可能所有的数据都为null，所以建议使用 count(*)
    - 查询数学成绩的最高分
        - select max(math) from stu;
    - 查询数学成绩的最低分
        - select min(math) from stu;
    - 查询数学成绩的总分
        - select sum(math) from stu;
    - 查询数学成绩的平均分
        - select avg(math) from stu;
    - 查询英语成绩的最低分  
        - select min(english) from stu;

8. 分组查询(GROUP BY)
- 语法
    - SELECT 字段列表 FROM 表名 [WHERE 分组前条件限定] GROUP BY 分组字段名 [HAVING 分组后条件过滤];
    - 注意：分组之后，查询的字段为聚合函数和分组字段，查询其他字段无任何意义。
- 练习
    - 查询男同学和女同学各自的数学平均分
        - select sex, avg(math) from stu group by sex;
            - 注意：**分组之后，查询的字段为聚合函数和分组字段**，查询其他字段无任何意义
                - select name, sex, avg(math) from stu group by sex; -- 这里查询name字段就没有任何意义
    - 查询男同学和女同学各自的数学平均分，以及各自人数
        - select sex, avg(math),count(*) from stu group by sex;
    - 查询男同学和女同学各自的数学平均分，以及各自人数，要求：分数低于70分的不参与分组
        - select sex, avg(math),count(*) from stu where math > 70 group by sex;
    - 查询男同学和女同学各自的数学平均分，以及各自人数，要求：分数低于70分的不参与分组，分组之后人数大于2个的
        - select sex, avg(math),count(*) from stu where math > 70 group by sex having count(*) > 2;
- **where和having的区别**
    - 执行时机不一样：where 是分组之前进行限定，不满足where条件，则不参与分组，**而having是分组之后对结果进行过滤**
    - 可判断的条件不一样：where 不能对聚合函数进行判断，having 可以。
- 执行顺序
    - where > 聚合函数 > having 

9. 分页查询(LIMIT)
- 用处：大家在很多网站都见过类似的效果，如京东、百度、淘宝等。分页查询是将数据一页一页的展示给用户看，用
户也可以通过点击查看下一页的数据。
- 语法：
    - SELECT 字段列表 FROM 表名 LIMIT 起始索引 , 查询条目数;
    - 起始索引是从0开始的;
- 练习
- 从0开始查询，查询3条数据
    - select * from stu limit 0 , 3;
- 每页显示3条数据，查询第1页数据
    - select * from stu limit 0 , 3;
- 每页显示3条数据，查询第2页数据
    - select * from stu limit 3 , 3;
- 每页显示3条数据，查询第3页数据
    - select * from stu limit 6 , 3;
- 总结；从上面的练习推导出起始索引计算公式：
    - 起始索引 = (当前页码 - 1) * 每页显示的条数

**tips**
- 分页查询limit是Mysql数据库的方言
- Oracle分页查询使用rownumber
- SQL Server分页查询使用top



