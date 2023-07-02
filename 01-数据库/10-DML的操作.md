DML; 对表中数据进行增删改

DML
- 添加(insert)
    - 给指定的列添加数据; 
        - INSERT INTO 表名(列名1,列名2,…) VALUES(值1,值2,…);
    - 给全部列添加数据;
        - INSERT INTO 表名 VALUES(值1,值2,…);
    - 批量添加数据
        - INSERT INTO 表名(列名1,列名2,…) VALUES(值1,值2,…),(值1,值2,…),(值1,值2,…)…;
        - INSERT INTO 表名 VALUES(值1,值2,…),(值1,值2,…),(值1,值2,…)…;

- 修改(update)
    - 修改表数据； 多个值进行修改的话，中间用逗号隔开！
        - UPDATE 表名 SET 列名1=值1,列名2=值2,… [WHERE 条件] ;
    - 注意：如果update语句没有添加where条件，则会将表中所有数据全部修改；

- 删除(delete)
    - DELETE FROM 表名 [WHERE 条件] ;