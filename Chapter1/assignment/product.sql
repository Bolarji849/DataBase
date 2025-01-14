use e_commerce;
CREATE TABLE product(
	ProductId int PRIMARY KEY,
    Product_name VARCHAR(100) UNIQUE,
    Product_description VARCHAR(225),
    price float,
    Goods_quantity int
);
