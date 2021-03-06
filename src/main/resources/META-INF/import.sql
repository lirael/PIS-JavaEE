CREATE TABLE useraccount (
	user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR (255)  NOT NULL,
	username VARCHAR (255) NOT NULL, 
	surname	VARCHAR (255)  NOT NULL, 
	password VARCHAR (255)  NOT NULL, 
	enabled BOOLEAN,
	role VARCHAR (255)  NOT NULL, 
	phone_number VARCHAR (255)  NOT NULL, 
	date DATE NOT NULL
	);

CREATE TABLE brand (
    brand_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);	

CREATE TABLE model (
    model_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(255) NOT NULL,
    brand INTEGER NOT NULL,
    FOREIGN KEY (brand) REFERENCES brand(brand_id)
);

CREATE TABLE car (
	car_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	brand INTEGER  NOT NULL,
	model INTEGER  NOT NULL,
	car_year VARCHAR(255)  NOT NULL,
	description VARCHAR(255),
	equipment VARCHAR(255),
	price DECIMAL(8, 2)  NOT NULL,
	FOREIGN KEY (brand) REFERENCES brand(brand_id),
	FOREIGN KEY (model) REFERENCES model(model_id));

CREATE TABLE client (
	client_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	client_name VARCHAR (255) NOT NULL, 
	surname	VARCHAR (255)  NOT NULL, 
	email VARCHAR (255)  NOT NULL,
	phone_number VARCHAR (255)  NOT NULL, 
	birthday DATE,
	status VARCHAR (255)
	);

CREATE TABLE client_car (
	client_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE client_manager (
	client_id INTEGER NOT NULL,
	manager_id INTEGER NOT NULL,
	FOREIGN KEY (client_id) REFERENCES client(client_id),
	FOREIGN KEY (manager_id) REFERENCES useraccount(user_id)
);

CREATE TABLE meeting (
	meeting_id INTEGER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR (255)  NOT NULL,
	place VARCHAR (255),
	date DATE,
	description	VARCHAR (255),
	results	VARCHAR (255),
	time VARCHAR (255),
	contract_state VARCHAR (255),
	meeting_state VARCHAR (255),
	manager INTEGER NOT NULL,
	client INTEGER,
	FOREIGN KEY (manager) REFERENCES useraccount(user_id),
	FOREIGN KEY (client) REFERENCES client(client_id)
);

INSERT INTO useraccount(user_id,email,username,surname,password,enabled,role,phone_number,date)
VALUES ('1','admin@gmail.com','demo','demo','demo',true,'ROLE_ADMIN','123456789','2017-04-19');

INSERT INTO useraccount(user_id,email,username,surname,password,enabled,role,phone_number,date)
VALUES ('2','manager@gmail.com','demo','demo','demo',true,'ROLE_MANAGER','123456789','2017-04-19');

INSERT INTO useraccount(user_id,email,username,surname,password,enabled,role,phone_number,date)
VALUES ('4','manager2@gmail.com','demo','demo','demo',true,'ROLE_MANAGER','123456789','2017-04-19');

INSERT INTO useraccount(user_id,email,username,surname,password,enabled,role,phone_number,date)
VALUES ('3','supervisor@gmail.com','demo','demo','demo',true,'ROLE_SUPERVISOR','123456789','2017-04-19');


INSERT INTO brand(brand_id,brand_name)
VALUES ('1','Skoda');	

INSERT INTO brand(brand_id,brand_name)
VALUES ('2','Tesla');

INSERT INTO model(model_id,model_name,brand)
VALUES ('1','Oktavia','1');

INSERT INTO model(model_id,model_name,brand)
VALUES ('2','Electro','2');


INSERT INTO car(car_id,brand,model,car_year,description,equipment,price)
VALUES ('1','1','1','1997','good car','complect',10000);

INSERT INTO car(car_id,brand,model,car_year,description,equipment,price)
VALUES ('2','2','2','2012','good car','complect',50000);


INSERT INTO client(client_id,client_name,surname,email,phone_number,birthday,status)
VALUES ('1','John','Doe','client1@gmail.com','123456789','2017-04-19','New');

INSERT INTO client(client_id,client_name,surname,email,phone_number,birthday,status)
VALUES ('2','Jack','Doe Jr','client2@gmail.com','123456789','2017-04-19','Active');

INSERT INTO client(client_id,client_name,surname,email,phone_number,birthday,status)
VALUES ('3','Max','Doe','client2@gmail.com','123456789','2017-04-19','Active');

INSERT INTO client(client_id,client_name,surname,email,phone_number,birthday,status)
VALUES ('4','Jim','Doe','client2@gmail.com','123456789','2017-04-19','Active');


INSERT INTO client_car(client_id, car_id)
VALUES ('1', '1');

INSERT INTO client_car(client_id, car_id)
VALUES ('1', '2');


INSERT INTO client_manager(client_id,manager_id)
VALUES ('1', '2');

INSERT INTO client_manager(client_id,manager_id)
VALUES ('3', '2');

INSERT INTO client_manager(client_id,manager_id)
VALUES ('1', '4');

INSERT INTO client_manager(client_id,manager_id)
VALUES ('2', '2');


INSERT INTO meeting(meeting_id,title,place,date,description,results,time,contract_state,meeting_state,manager,client)
VALUES ('1', 'Skoda meeting','Grand Hotel','2017-05-10','negotiations','signed contract','10:00','signed','approved','4','1');

INSERT INTO meeting(meeting_id,title,place,date,description,results,time,contract_state,meeting_state,manager,client)
VALUES ('2', 'Ferrari meeting','Grand Palace','2017-05-10','negotiations','signed contract','11:00','signed','approved','2','1');


INSERT INTO meeting(meeting_id,title,place,date,description,results,time,contract_state,meeting_state,manager,client)
VALUES ('3', 'Conference meeting','Hotel','2017-05-15','negotiations','signed contract','10:00','signed','approved','4','2');

INSERT INTO meeting(meeting_id,title,place,date,description,results,time,contract_state,meeting_state,manager,client)
VALUES ('4', 'Ferrari','Grand Palace','2017-05-15','negotiations','signed contract','11:00','signed','approved','2','2');