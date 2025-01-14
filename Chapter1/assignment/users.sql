use e_commerce;
CREATE TABLE user(
	UserId int PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50) UNIQUE
);