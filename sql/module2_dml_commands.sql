# DML Commands

# INSERT
insert into product(prod_id, prod_name, category) values(1, "Iphone", "Phone");
select * from product;

insert into product values(2, "Dell Inspiron", "Laptop");
select * from product;

# INSERT AS SELECT STATEMENT - It allows to insert into table using the input from another table
# Record from one table will be inserted into another table
insert into product(prod_id, prod_name, category) (select id, f_name, l_name from patient);
select * from product;

# UPDATE
# DELETE
# SELECT