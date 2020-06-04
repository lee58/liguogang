-- 创建user表
CREATE TABLE user (
	id INT PRIMARY KEY auto_increment,
	name VARCHAR (50) UNIQUE,
	email VARCHAR (50),
	password VARCHAR (255)
);