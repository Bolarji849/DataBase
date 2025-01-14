use e_commerce;
CREATE TABLE orders(
	Order_Id int primary key,
    ProductId int,
    UserId int,
    foreign key(ProductId) References product(ProductId),
    foreign key(UserId) References user(UserId) 
);