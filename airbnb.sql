create schema if not exists airbnb ;
use airbnb;

create table if not exists currency(
	currencyID int not null,
    currencyName varchar(225) not null,
    primary key (currencyID)
);

insert into currency values(1, 'egp');
insert into currency values(2, 'usd');
insert into currency values(3,'euro');
insert into currency values(4,'rub');
insert into currency values(5,'cad');
insert into currency values(6,'nzd');
insert into currency values(7,'hkd');
insert into currency values(8,'jod');
insert into currency values(9,'aud');
insert into currency values(10,'mad');
insert into currency values(11,'qar');
insert into currency values(12,'ars');
insert into currency values(13,'bhd');
insert into currency values(14,'bbd');
insert into currency values(15,'brl');
insert into currency values(16,'xaf');
insert into currency values(17,'kzt');
insert into currency values(18,'mvr');
insert into currency values(19,'fkp');
insert into currency values(20,'dkk');

create table if not exists giftcards(
	giftcardID int not null,
    discount_amount decimal(10),
    currencyID int not null,
    primary key (giftcardID),
    foreign key (currencyID) references currency(currencyID) on update cascade on delete cascade
);

insert into giftcards values(1, 100,1);
insert into giftcards values(2, 400,2);
insert into giftcards values(3, 500,3);
insert into giftcards values(4, 500,4);
insert into giftcards values(5, 300,2);
insert into giftcards values(6, 50,2);
insert into giftcards values(7, 10,2);
insert into giftcards values(8, 30,2);
insert into giftcards values(9, 100,2);
insert into giftcards values(10, 50,2);
insert into giftcards values(11, 50,2);
insert into giftcards values(12, 70,2);
insert into giftcards values(13, 10,2);
insert into giftcards values(14, 300,2);
insert into giftcards values(15, 100,2);
insert into giftcards values(16, 20,2);
insert into giftcards values(17, 80,2);
insert into giftcards values(18, 50,2);
insert into giftcards values(19, 60,2);
insert into giftcards values(20, 90,2);

create table if not exists country(
	countryID int not null,
    countryName varchar(225) not null,
    countryCode varchar(5) not null,
    primary key (countryID)
);

insert into country values(1,'United States','USA');
insert into country values(2, 'United Kingdom', 'UK');
insert into country values(3, 'canada', 'CA');
insert into country values(4, 'Afghanistan', 'AF');
insert into country values(5, 'Albania', 'AL');
insert into country values(6, 'Argentina', 'AR');
insert into country values(7, 'Australia', 'AU');
insert into country values(8, 'Bahrain', 'BH');
insert into country values(9, 'Brazil', 'BR');
insert into country values(10, 'Bulgaria', 'BG');
insert into country values(11, 'China', 'CN');
insert into country values(12, 'Colombia', 'CO');
insert into country values(13, 'Croatia', 'HR');
insert into country values(14, 'Egypt', 'EG');
insert into country values(15, 'France', 'FR');
insert into country values(16, 'Germany', 'DE');
insert into country values(17, 'Greece', 'GR');
insert into country values(18, 'Iceland', 'IS');
insert into country values(19, 'Malaysia', 'MY');
insert into country values(20, 'Mexico', 'MX');

create table if not exists state(
	stateID int not null,
    countryID int not null,
    stateName varchar(225) not null,
    stateCode varchar(5) not null,
    primary key (stateID),
    foreign key (countryID) references country(countryID) on update cascade on delete cascade
);

insert into state values(1,1,'new york', 'NY');
insert into state values(2,1,'ohio', 'OH');
insert into state values(3,3,'toronto', 'TOR');
insert into state values(4,1,'pennsylvania','PA');
insert into state values(5,1,'new jersey','NJ');
insert into state values(6,1,'nevada','NV');
insert into state values(7,1,'oklahoma','OK');
insert into state values(8,1,'Texas','TX');
insert into state values(9,1,'utah','UT');
insert into state values(10,1,'vermont','VT');
insert into state values(11,1,'alabama','AL');
insert into state values(12,1,'california','CA');
insert into state values(13,1,'maine','ME');
insert into state values(14,1,'maryland','MD');
insert into state values(15,3,'quebec','QUE');
insert into state values(16,1,'ontario','ONT');
insert into state values(17,16,'berlin','BE');
insert into state values(18,16,'hamburg','HH');
insert into state values(19,16,'bremen','HB');
insert into state values(20,16,'hesse','HE');

create table if not exists city(
	cityID int not null,
	stateID int not null,
    cityName varchar(225) not null,
    primary key (cityID),
    foreign key (stateID) references state(stateID) on update cascade on delete cascade
);

insert into city values(1,2,'columbus');
insert into city values(2,3,'toronto');
insert into city values(3,1,'new york');
insert into city values(4,4,'philly');
insert into city values(5,'1','yonkers');
insert into city values(6,'1','long beach');
insert into city values(7,'1','spring valley');
insert into city values(8,'1','new castle');
insert into city values(9,'2','cleveland');
insert into city values(10,'2','cincinnati');
insert into city values(11,'2','dayton');
insert into city values(12,'2','youngstown');
insert into city values(13,'16','barrie');
insert into city values(14,'16','cornwall');
insert into city values(15,'16','dryden');
insert into city values(16,'17','berlin');
insert into city values(17,'18','hamburg');
insert into city values(18,'12','los angeles');
insert into city values(19,'12','san diego');
insert into city values(20,'12','san jose');

create table if not exists addresses(
	addressID int not null,
    address text not null,
    cityID int not null,
    primary key (addressID),
    foreign key (cityID) references city (cityID) on update cascade on delete cascade
);

insert into addresses values(1, '20 5th street', 1);
insert into addresses values(2,'22 100th street',3);
insert into addresses values(3, '100th street',4);
insert into addresses values(4, '2 16th street',2);
insert into addresses values(5, '10 90th street',5);
insert into addresses values(6, '5 8th street',6);
insert into addresses values(7, '100th street',7);
insert into addresses values(8, '14 17th street',8);
insert into addresses values(9, '10 5th street',9);
insert into addresses values(10, '15th street',10);
insert into addresses values(11, '16 5th street',11);
insert into addresses values(12, '18 5th street',12);
insert into addresses values(13, '5 10th street',13);
insert into addresses values(14, '20 10th street',14);
insert into addresses values(15, '9 8th street',15);
insert into addresses values(16, '7 4th street',16);
insert into addresses values(17, '80 3rd street',17);
insert into addresses values(18, '10 2nd street',18);
insert into addresses values(19, '100 5th street',19);
insert into addresses values(20, '17 6th street',20);

create table if not exists room_types(
	room_typeID int not null,
    roomDescription text not null,
    primary key (room_typeID)
);

insert into room_types values(1,'shared room');
insert into room_types values(2,'private room');
insert into room_types values(3,'entire place');
insert into room_types values(4,'hotel room');

create table if not exists property_types(
	property_typeID int not null,
    propertyDescription text not null,
    primary key (property_typeID)
);

insert into property_types values(1,'hotel');
insert into property_types values(2,'hostel');
insert into property_types values(3,'apartment');
insert into property_types values(4,'house');
insert into property_types values(5,'secondary unit');
insert into property_types values(6,'bed and breakfast');
insert into property_types values(7,'inn');

create table if not exists cancelation_policy(
	cancellation_policyID int not null,
    cancellation_fees decimal(10) not null,
    currencyID int not null,
    primary key (cancellation_policyID),
    foreign key (currencyID) references currency(currencyID) on update cascade on delete cascade
);
insert into cancelation_policy values(1,100,2);
insert into cancelation_policy values(2,1000,3);
insert into cancelation_policy values(3,50,2);
insert into cancelation_policy values(4,0,2);
insert into cancelation_policy values(5,55,2);
insert into cancelation_policy values(6,60,2);
insert into cancelation_policy values(7,12,2);
insert into cancelation_policy values(8,20,2);
insert into cancelation_policy values(9,10,2);
insert into cancelation_policy values(10,30,2);
insert into cancelation_policy values(11,40,2);
insert into cancelation_policy values(12,80,2);
insert into cancelation_policy values(13,90,2);
insert into cancelation_policy values(14,110,2);
insert into cancelation_policy values(15,15,2);
insert into cancelation_policy values(16,17,2);
insert into cancelation_policy values(17,65,2);
insert into cancelation_policy values(18,95,2);
insert into cancelation_policy values(19,113,2);
insert into cancelation_policy values(20,105,2);

create table if not exists credit_cards(
	cardID int not null,
    card_num int not null,
    card_holder varchar(225) not null,
    currencyID int not null,
    primary key (cardID),
    foreign key (currencyID) references currency(currencyID) on update cascade on delete cascade
);

insert into credit_cards values(1,123456789,'john smith',2);
insert into credit_cards values(2,823366742,'sam jack',1);
insert into credit_cards values(4,216545613,'maria kane',4);
insert into credit_cards values(5,351545415,'anna lame',2);
insert into credit_cards values(6,321545415,'adam brad',2);
insert into credit_cards values(7,325448717,'ahmed aly',2);
insert into credit_cards values(8,872873983,'jose gomez',3);
insert into credit_cards values(9,626526524,'hanna stilinski',4);
insert into credit_cards values(10,245687731,'rodrigo jose',5);
insert into credit_cards values(11,878921548,'john kane',6);
insert into credit_cards values(12,616543228,'maria brad',7);
insert into credit_cards values(13,314875187,'sam gomez',8);
insert into credit_cards values(14,985615487,'adam aly',9);
insert into credit_cards values(15,165485464,'hanna jack',10);
insert into credit_cards values(16,531324564,'ahmed smith',11);
insert into credit_cards values(17,642464421,'rodrigo gomez',12);
insert into credit_cards values(18,666345878,'anna stilinski',13);
insert into credit_cards values(19,354165487,'mara lame',14);
insert into credit_cards values(20,324654545,'bella robert',15);
insert into credit_cards values(3,545422641,'leo messi',16);

create table if not exists users(
	userID int not null,
    firstName varchar(225) not null,
    lastName varchar(225) not null,
    date_of_birth date not null,
    email varchar(225) not null,
    userPassword text not null,
    create_date datetime not null,
    last_update datetime not null,
    addressID int,
    phone_number varchar(50) not null,
    primary key (userID),
    foreign key (addressID) references addresses(addressID) on update cascade on delete set null
);
    
insert into users values(1,'john','smith','1995-06-15','johnsmith@gmail.com','123password!',current_timestamp(),current_timestamp(),1,+401237921);
insert into users values(2,'maria','kane','1989-12-01','mariakane@gmail.com','123password!',current_timestamp(),current_timestamp(),2,+204605632);
insert into users values(3,'sam','jack','1999-07-29','samjack@gmail.com','123password!',current_timestamp(),current_timestamp(),4,+215456542);
insert into users values(4,'anna','lame','1968-08-09','annalame@gmail.com','123password!',current_timestamp(),current_timestamp(),5,+232313542);
insert into users values(5,'adam','brad','1986-03-24','adambrad@gmail.com','123password!',current_timestamp(),current_timestamp(),6,+541462871);
insert into users values(6,'ahmed','aly','1978-12-17','ahmedaly@gmail.com','123password!',current_timestamp(),current_timestamp(),5,+1326223345);
insert into users values(7,'jose','gomes','1994-04-09','josegomez@gmail.com','123password!',current_timestamp(),current_timestamp(),6,+2654152211);
insert into users values(8,'hanna','stilinski','1998-07-20','hannastilinski@gmail.com','123password!',current_timestamp(),current_timestamp(),7,+2562426524);
insert into users values(9,'rodrigo','jose','1999-07-29','rodrigojose@gmail.com','123password!',current_timestamp(),current_timestamp(),8,+4300256214);
insert into users values(10,'john','kane','1987-04-20','johnkane@gmail.com','123password!',current_timestamp(),current_timestamp(),3,+4646424517);
insert into users values(11,'maria','brad','1991-11-12','mariabrad@gmail.com','123password!',current_timestamp(),current_timestamp(),9,+231436428);
insert into users values(12,'sam','gomes','1976-02-01','samgomez@gmail.com','123password!',current_timestamp(),current_timestamp(),10,+32188716);
insert into users values(13,'adam','aly','1987-03-26','adamaly@gmail.com','123password!',current_timestamp(),current_timestamp(),11,+654665377);
insert into users values(14,'hanna','jack','1963-10-14','hannajack.com','123password!',current_timestamp(),current_timestamp(),12,+41397256);
insert into users values(15,'ahmed','smith','1997-09-12','ahmedsmith@gmail.com','123password!',current_timestamp(),current_timestamp(),13,+99297710);
insert into users values(16,'rodrigo','gomez','1986-07-19','rodrigogomez@gmail.com','123password!',current_timestamp(),current_timestamp(),14,+1543572921);
insert into users values(17,'anna','stilinski','1996-04-21','annastilinski@gmail.com','123password!',current_timestamp(),current_timestamp(),14,+867272789);
insert into users values(18,'mara','lame','1992-06-15','maralame@gmail.com','123password!',current_timestamp(),current_timestamp(),15,+676872711);
insert into users values(19,'bella','robert','1975-09-28','bellarobert@gmail.com','123password!',current_timestamp(),current_timestamp(),16,+65424831);
insert into users values(20,'leo','messi','1992-06-23','leomessi@gmail.com','123password!',current_timestamp(),current_timestamp(),8,+5771787187);

create table if not exists payment_options(
	payment_optionID int not null,
    cardID int not null,
    userID int not null,
    primary key (payment_optionID),
    foreign key (cardID) references credit_cards(cardID) on update cascade on delete cascade,
    foreign key (userID) references users(userID) on update cascade on delete cascade
);
insert into payment_options values(1,1,1);
insert into payment_options values(2,1,2);
insert into payment_options values(3,2,3);
insert into payment_options values(4,4,9);
insert into payment_options values(5,5,4);
insert into payment_options values(6,6,5);
insert into payment_options values(7,7,6);
insert into payment_options values(8,8,7);
insert into payment_options values(9,9,8);
insert into payment_options values(10,10,11);
insert into payment_options values(11,11,10);
insert into payment_options values(12,11,12);
insert into payment_options values(13,5,15);
insert into payment_options values(14,5,16);
insert into payment_options values(15,5,17);
insert into payment_options values(16,12,18);
insert into payment_options values(17,13,19);
insert into payment_options values(18,14,13);
insert into payment_options values(19,15,14);
insert into payment_options values(20,20,20);

create table if not exists all_hosts(
	hostID int not null,
    userID int not null,
    primary key (hostID),
    foreign key (userID) references users(userID) on update cascade on delete cascade
);

insert into all_hosts values(1,1);
insert into all_hosts values(2,2);
insert into all_hosts values(3,3);
insert into all_hosts values(4,4);
insert into all_hosts values(5,5);
insert into all_hosts values(6,6);
insert into all_hosts values(7,7);
insert into all_hosts values(8,8);
insert into all_hosts values(9,9);
insert into all_hosts values(10,10);
insert into all_hosts values(11,11);
insert into all_hosts values(12,12);
insert into all_hosts values(13,13);
insert into all_hosts values(14,14);
insert into all_hosts values(15,15);
insert into all_hosts values(16,16);
insert into all_hosts values(17,17);
insert into all_hosts values(18,18);
insert into all_hosts values(19,19);
insert into all_hosts values(20,20);

create table if not exists all_guests(
	guestID int not null,
    userID int not null,
    primary key (guestID),
    foreign key (userID) references users(userID) on update cascade on delete cascade
);

insert into all_guests values(5,1);
insert into all_guests values(8,2);
insert into all_guests values(3,3);
insert into all_guests values(4,4);
insert into all_guests values(1,5);
insert into all_guests values(6,6);
insert into all_guests values(7,7);
insert into all_guests values(2,8);
insert into all_guests values(9,9);
insert into all_guests values(10,10);
insert into all_guests values(11,11);
insert into all_guests values(12,12);
insert into all_guests values(13,13);
insert into all_guests values(14,14);
insert into all_guests values(15,15);
insert into all_guests values(16,16);
insert into all_guests values(17,17);
insert into all_guests values(18,18);
insert into all_guests values(19,19);
insert into all_guests values(20,20);

create table if not exists properties(
	propertyID int not null,
    hostID int not null,
    pName varchar(225) not null,
    addressID int not null,
	pDescription text not null,
    min_stay int not null,
    price_per_day decimal(10) not null,
    available_from date not null,
    available_to date not null,
    currencyID int,
    property_typeID int,
    num_of_rooms int not null,
    num_of_guests int not null,
    create_date datetime not null,
    last_update datetime not null,
    room_typeID int,
    cancellation_policyID int,
    primary key (propertyID),
    foreign key (hostID) references all_hosts(hostID) on update cascade on delete cascade,
    foreign key (addressID) references addresses(addressID) on update cascade on delete cascade,
    foreign key (currencyID) references currency(currencyID) on update cascade on delete set null,
    foreign key (property_typeID) references property_types(property_typeID) on update cascade on delete set null,
    foreign key (room_typeID) references room_types(room_typeID) on update cascade on delete set null,
    foreign key (cancellation_policyID) references cancelation_policy(cancellation_policyID) on update cascade on delete set null
);
insert into properties values(001,1,'garden hotel',1,'a very nice hotel by in downtown columbus',1,50,'2023-06-05','2023-06-06',2,1,1,2,current_timestamp(),current_timestamp(),2,3);
insert into properties values(002,2,'paradise',2,'a very nice apartment by in ny',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,4);
insert into properties values(003,3,'bella',3,'a very nice apartment by in philly',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,7);
insert into properties values(004,4,'gardenia',5,'a very nice apartment by in ny',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,15);
insert into properties values(005,5,'aloha',6,'a very nice apartment by in ny',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,3);
insert into properties values(006,6,'mala inn',7,'a very nice apartment by in ny',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,4);
insert into properties values(007,7,'bohemian',8,'a very nice apartment by in ny',1,50,'2023-06-01','2023-06-30',2,3,3,6,current_timestamp(),current_timestamp(),3,7);
insert into properties values(008,8,'safe haven',9,'a hostel',1,50,'2023-06-01','2023-06-30',2,2,1,1,current_timestamp(),current_timestamp(),1,15);
insert into properties values(009,9,'roma',10,'a room in a house',1,50,'2023-06-01','2023-06-30',2,5,1,1,current_timestamp(),current_timestamp(),2,3);
insert into properties values(010,1,'sola',11,'private room in a shared apartment',1,50,'2023-06-01','2023-06-30',2,5,1,1,current_timestamp(),current_timestamp(),2,4);
insert into properties values(011,2,'wrens bnb',12,'a classy bed and breakfast',1,50,'2023-06-01','2023-06-30',2,6,1,2,current_timestamp(),current_timestamp(),1,7);
insert into properties values(012,3,'ballroom',13,'a very nice house',1,50,'2023-06-01','2023-06-30',2,4,2,5,current_timestamp(),current_timestamp(),3,15);
insert into properties values(013,4,'paradise inn',14,'an inn in the downtown area',1,50,'2023-06-01','2023-06-30',2,7,1,3,current_timestamp(),current_timestamp(),2,3);
insert into properties values(014,10,'4 seasons',15,'5 starts hotel',1,50,'2023-06-01','2023-06-30',2,1,1,2,current_timestamp(),current_timestamp(),4,4);
insert into properties values(015,5,'annas',16,'a very nice house',1,50,'2023-06-01','2023-06-30',2,4,2,4,current_timestamp(),current_timestamp(),3,7);
insert into properties values(016,17,'bees hostel',18,'a girls only hostel',1,50,'2023-06-01','2023-06-30',2,2,1,1,current_timestamp(),current_timestamp(),1,15);
insert into properties values(017,18,'peroka',17,'a boys only hostel',1,50,'2023-06-01','2023-06-30',2,2,1,1,current_timestamp(),current_timestamp(),1,3);
insert into properties values(018,19,'delta',19,'a mixed hostel',1,50,'2023-06-01','2023-06-30',2,2,1,1,current_timestamp(),current_timestamp(),1,4);
insert into properties values(019,8,'luxory',20,'5 starts hotel',1,50,'2023-06-01','2023-06-30',2,1,1,2,current_timestamp(),current_timestamp(),4,7);
insert into properties values(020,9,'luxorious',4,'inn',1,50,'2023-06-01','2023-06-30',2,7,1,3,current_timestamp(),current_timestamp(),2,15);


create table if not exists bookings(
	bookingID int not null,
    guestID int not null,
    propertyID int not null,
    start_date date not null,
    end_date date not null,
    price decimal(10) not null,
    create_date datetime not null,
    last_update datetime not null,
	primary key (bookingID),
    foreign key (guestID) references all_guests(guestID) on update cascade on delete cascade,
    foreign key (propertyID) references properties(propertyID) on update cascade on delete cascade
);

insert into bookings values(111,8,001,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(112,5,002,'2023-06-01','2023-06-03',100,current_timestamp(), current_timestamp());
insert into bookings values(113,3,003,'2023-06-04','2023-06-06',100,current_timestamp(), current_timestamp());
insert into bookings values(114,11,004,'2023-06-07','2023-06-09',100,current_timestamp(), current_timestamp());
insert into bookings values(115,12,002,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(116,13,006,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(117,14,007,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(118,15,008,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(119,16,004,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(110,17,010,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(101,18,011,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(102,19,012,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(103,20,013,'2023-06-05','2023-06-06',50,current_timestamp(), current_timestamp());
insert into bookings values(104,8,002,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(105,3,015,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(106,5,001,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(107,11,017,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(108,13,007,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(109,14,019,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());
insert into bookings values(100,20,020,'2023-06-08','2023-06-09',50,current_timestamp(), current_timestamp());


create table if not exists receipts(
	receiptID int not null,
    hostID int not null,
    guestID int not null,
    payment_optionID int not null,
    bookingID int not null,
    giftcardID int,
    payment_amount decimal(10) not null,
    primary key (receiptID),
    foreign key (guestID) references all_guests(guestID) on update cascade on delete no action,
    foreign key (hostID) references all_hosts(hostID) on update cascade on delete no action,
	foreign key (payment_optionID) references payment_options(payment_optionID) on update cascade on delete no action,
	foreign key (bookingID) references bookings(bookingID) on update cascade on delete no action,
    foreign key (giftcardID) references giftcards(giftcardID) on update cascade on delete no action
);
insert into receipts values(100,1,8,2,111,null,50);
insert into receipts values(200,2,5,1,112,18,50);
insert into receipts values(300,3,3,3,113,10,50);
insert into receipts values(400,4,11,10,114,11,50);
insert into receipts values(500,5,12,12,115,null,100);
insert into receipts values(600,6,13,18,116,null,50);
insert into receipts values(700,7,14,19,117,null,50);
insert into receipts values(800,8,15,13,118,7,40);
insert into receipts values(900,9,16,14,119,null,50);
insert into receipts values(110,1,17,15,110,null,50);
insert into receipts values(120,2,18,16,101,8,20);
insert into receipts values(130,3,19,17,102,null,50);
insert into receipts values(140,4,20,20,103,null,50);
insert into receipts values(150,10,8,2,104,16,80);
insert into receipts values(160,5,3,3,105,null,50);
insert into receipts values(170,17,5,1,106,null,50);
insert into receipts values(180,18,11,10,107,null,50);
insert into receipts values(190,19,13,18,108,13,40);
insert into receipts values(111,8,14,19,109,null,50);
insert into receipts values(112,9,20,20,100,null,50);

create table if not exists reviews(
	reviewID int not null,
    bookingID int not null,
    guestID int not null,
    propertyID int not null,
    rDiscription text not null,
    primary key (reviewID),
    foreign key (bookingID) references bookings(bookingID) on update cascade on delete no action,
    foreign key (guestID) references all_guests(guestID) on update cascade on delete no action,
	foreign key (propertyID) references properties(propertyID) on update cascade on delete cascade
);
insert into reviews values(100,111,8,001,'great stay!');
insert into reviews values(200,112,5,002,'nice rooms!');
insert into reviews values(300,113,3,003,'great!');
insert into reviews values(400,114,11,004,'great!');
insert into reviews values(500,115,12,002,'great!');
insert into reviews values(600,116,13,006,'great!');
insert into reviews values(700,117,14,007,'great!');
insert into reviews values(800,118,15,008,'great!');
insert into reviews values(900,119,16,004,'great!');
insert into reviews values(110,110,17,010,'great!');
insert into reviews values(111,101,18,011,'great!');
insert into reviews values(112,102,19,012,'great!');
insert into reviews values(113,103,20,013,'great!');
insert into reviews values(114,104,8,002,'great!');
insert into reviews values(115,105,3,015,'great!');
insert into reviews values(116,106,5,001,'great!');
insert into reviews values(117,107,11,017,'great!');
insert into reviews values(118,108,13,007,'great!');
insert into reviews values(119,109,14,019,'great!');
insert into reviews values(120,100,20,020,'great!');

create table if not exists ratings(
	ratingID int not null,
    bookingID int not null,
    guestID int not null,
    propertyID int not null,
    rating int not null,
    primary key (ratingID),
    foreign key (bookingID) references bookings(bookingID)on update cascade on delete no action,
    foreign key (guestID) references all_guests(guestID)on update cascade on delete no action,
	foreign key (propertyID) references properties(propertyID) on update cascade on delete cascade
);

insert into ratings values(100,111,8,001,3);
insert into ratings values(200,112,5,002,4);
insert into ratings values(300,113,3,003,3);
insert into ratings values(400,114,11,004,2);
insert into ratings values(500,115,12,002,1);
insert into ratings values(600,116,13,006,5);
insert into ratings values(700,117,14,007,1);
insert into ratings values(800,118,15,008,3);
insert into ratings values(900,119,16,004,2);
insert into ratings values(110,110,17,010,1);
insert into ratings values(111,101,18,011,5);
insert into ratings values(112,102,19,012,4);
insert into ratings values(113,103,20,013,3);
insert into ratings values(114,104,8,002,2);
insert into ratings values(115,105,3,015,1);
insert into ratings values(116,106,5,001,5);
insert into ratings values(117,107,11,017,4);
insert into ratings values(118,108,13,007,4);
insert into ratings values(119,109,14,019,3);
insert into ratings values(120,100,20,020,2);

create table if not exists amenities(
	amenityID int not null,
    amenityName varchar(225),
    primary key (amenityID)
);
insert into amenities values(100, 'parking');
insert into amenities values(200, 'wifi');
insert into amenities values(300, 'bathroom');
insert into amenities values(400, 'toilet paper');
insert into amenities values(500, 'soap');
insert into amenities values(600, 'towels');
insert into amenities values(700, 'pillows');
insert into amenities values(800, 'cleaning supplies');

create table if not exists property_amenities(
	property_amenityID int not null,
    amenityID int not null,
    propertyID int not null,
    amenityDescription text not null,
    primary key (property_amenityID),
    foreign key (propertyID) references properties(propertyID) on update cascade on delete cascade,
    foreign key (amenityID) references amenities(amenityID) on update cascade on delete no action
);
insert into property_amenities values(1,100,001,'free parking');
insert into property_amenities values(2,200,002,'free wifi');
insert into property_amenities values(3,300,003,'private bathrooms available');
insert into property_amenities values(4,400,004,'toilet paper available');
insert into property_amenities values(5,500,005,'2 bars of soap');
insert into property_amenities values(6,600,006,'1 towel per guest');
insert into property_amenities values(7,700,007,'1 pillow per guest');
insert into property_amenities values(8,800,008,'cleaning supplies available');
insert into property_amenities values(9,100,009,'free parking');
insert into property_amenities values(10,200,010,'free wifi');
insert into property_amenities values(11,300,011,'private bathrooms available');
insert into property_amenities values(12,400,012,'toilet paper available');
insert into property_amenities values(13,500,013,'2 bars of soap');
insert into property_amenities values(14,600,014,'1 towel per guest');
insert into property_amenities values(15,700,015,'1 pillow per guest');
insert into property_amenities values(16,800,016,'cleaning supplies available');
insert into property_amenities values(17,100,017,'free parking');
insert into property_amenities values(18,100,018,'free parking');
insert into property_amenities values(19,200,019,'free wifi');
insert into property_amenities values(20,200,020,'free wifi');