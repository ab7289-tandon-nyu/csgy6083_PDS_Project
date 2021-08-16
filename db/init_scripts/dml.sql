-- USE ab_project.ab_project;



INSERT INTO ab_project.ab_user (user_id, user_name, email, password, type)
VALUES
	(1, 'alex_biehl', 'alex.biehl@nyu.edu', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(2, 'nick_biehl', 'nick.biehl@gmail.edu', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(3, 'joe_schmo', 'joe.schmo@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(4, 'tom_bob', 'tom.bob@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(5, 'richard_long', 'richard.long@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(6, 'harry_mo', 'harry_mo@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(7, 'abel_tutor', 'abel_tutor@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(8, 'abraham_lincoln', 'abraham.lincoln@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(9, 'melissa_pena', 'melissa.pena@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(10, 'matthew_taylor', 'matthew.taylor@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(11, 'chris_harris', 'chris.harris@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(12, 'nirali_patel', 'nirali.patel@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(13, 'madonna_cosby', 'madonna.cosby@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(14, 'neva_marsell', 'neva.marsell@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(15, 'tia_lino', 'tia.lino@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(16, 'gayla_gaimer', 'gayla.gamer@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(17, 'trey_trout', 'trey.trout@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(18, 'rosemarie_fields', 'rosemarie.fields@gmail.com', 'password', 'C');
INSERT INTO ab_project.ab_user
	(user_id, user_name, email, `password`, `type`)
VALUES
	(19, 'teri_erlwile', 'teri.erlwile@gmail.com', 'password', 'C');

COMMIT;

INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(1, 'Alex', NULL, 'Biehl', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(2, 'Nick', 'E', 'Biehl', 'M', 'S', 'AH', '123 Some Street', 'APT B', 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(3, 'Joe', NULL, 'Schmo', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(4, 'Tom', NULL, 'Bob', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(5, 'Richard', NULL, 'Long', 'M', 'M', 'H', '129 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(6, 'Harry', NULL, 'Mo', 'M', 'M', 'H', '123 Some Street', 'APT C', 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(7, 'Abel', NULL, 'Tutor', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(8, 'Abraham', NULL, 'Lincoln', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(9, 'Melissa', 'R', 'Pena', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(10, 'Mathew', NULL, 'Taylor', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(11, 'Chris', NULL, 'Harris', 'M', 'M', 'H', '123 Some Street', 'APT D', 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(12, 'Nirali', NULL, 'Patel', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(13, 'Madonna', NULL, 'Cosby', 'F', 'W', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(14, 'Neva', NULL, 'Marsell', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(15, 'Tia', NULL, 'Lino', 'F', 'M', 'H', '223 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(16, 'Gayla', NULL, 'Gaimer', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(17, 'Trey', NULL, 'Trout', 'M', 'M', 'H', '153 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(18, 'Rosemarie', NULL, 'Fields', 'F', 'M', 'AH', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_project.ab_customer
	(user_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip)
VALUES
	(19, 'Teri', NULL, 'Erlwile', 'F', 'S', 'AH', '126Some Street', NULL, 'Anytown', 'CA', '00000');

COMMIT;

-- role inserts

INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(1, 'admin', 'The administrative user');
INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(2, 'auto_reviewer', 'users who can review auto policy related data');
INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(3, 'auto_admin', 'users who can make changes to auto policy related data');
INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(4, 'home_reviewer', 'users who can review home policy related data');
INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(5, 'home_admin', 'users who can make changes to home policy related data');
INSERT INTO ab_project.ab_role
	(role_id, name, `desc`)
VALUES
	(6, 'user', "generic user role");

INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(1, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(2, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(3, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(4, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(5, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(6, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(7, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(8, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(9, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(10, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(11, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(12, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(13, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(14, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(15, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(16, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(17, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(18, 6);
INSERT INTO ab_project.ab_user_role_mtom
	(user_id, role_id)
VALUES
	(19, 6);

-- ab_project.ab policy inserts

INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(1, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL 0 YEAR), 1000.00, 'C', 1, 1);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(2, 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL 0 YEAR), 1000.00, 'C', 1, 2);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(3, 'H', ADDDATE(SYSDATE(), INTERVAL -5 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 3);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(4, 'A', ADDDATE(SYSDATE(), INTERVAL -2 YEAR), ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000.00, 'P', 0, 4);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(5, 'H', ADDDATE(SYSDATE(), INTERVAL -10 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 4);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(6, 'A', ADDDATE(SYSDATE(), INTERVAL -10 YEAR), ADDDATE(SYSDATE(), INTERVAL -5 YEAR), 1000.00, 'P', 0, 5);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(7, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 5);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(8, 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 6);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(9, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 7);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(10, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 8);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(11, 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 9);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(12, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 10);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(13, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 11);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(14, 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 12);
INSERT INTO ab_project.ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	(15, 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 13);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 14);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 15);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 16);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 1);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 17);
INSERT INTO ab_project.ab_policy
	(p_type, start_date, end_date, premium, state, active, user_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -7 YEAR), ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 1000.00, 'P', 0, 18);

COMMIT;

-- insert values into ab_project.ab_home and ab_project.ab_auto for their respective policies

INSERT INTO ab_project.ab_home (policy_id) VALUES (1);
INSERT INTO ab_project.ab_home (policy_id) VALUES (2);
INSERT INTO ab_project.ab_home (policy_id) VALUES (3);
INSERT INTO ab_project.ab_home (policy_id) VALUES (5);
INSERT INTO ab_project.ab_home (policy_id) VALUES (6);
INSERT INTO ab_project.ab_home (policy_id) VALUES (7);
INSERT INTO ab_project.ab_home (policy_id) VALUES (9);
INSERT INTO ab_project.ab_home (policy_id) VALUES (10);
INSERT INTO ab_project.ab_home (policy_id) VALUES (12);
INSERT INTO ab_project.ab_home (policy_id) VALUES (13);
INSERT INTO ab_project.ab_home (policy_id) VALUES (14);
INSERT INTO ab_project.ab_home (policy_id) VALUES (15);
INSERT INTO ab_project.ab_home (policy_id) VALUES (16);
INSERT INTO ab_project.ab_home (policy_id) VALUES (17);
INSERT INTO ab_project.ab_home (policy_id) VALUES (18);
INSERT INTO ab_project.ab_home (policy_id) VALUES (20);
INSERT INTO ab_project.ab_home (policy_id) VALUES (21);

INSERT INTO ab_project.ab_auto (policy_id) VALUES (1);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (2);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (3);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (4);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (5);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (6);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (8);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (9);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (11);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (12);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (14);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (15);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (16);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (17);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (18);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (19);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (20);
INSERT INTO ab_project.ab_auto (policy_id) VALUES (21);

COMMIT;

-- INSERT INTO ab_project.ab_HOUSE

INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 1);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 2500000.00, 2000, 'M', 1, 1, 'O', 0, 2);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -7 YEAR), 1500000.00, 2000, 'C', 1, 1, NULL, 0, 3);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -3 YEAR), 1000000.00, 2000, 'T', 1, 1, 'U', 0, 5);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -9 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 6);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -20 YEAR), 1000000.00, 2000, 'M', 1, 1, NULL, 0, 7);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -40 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 9);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -15 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 10);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -20 YEAR), 100000.00, 2000, 'S', 1, 1, NULL, 0, 12);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -3 YEAR), 1520000.00, 2000, 'S', 1, 1, NULL, 0, 13);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -8 YEAR), 5000000.00, 2000, 'S', 1, 1, 'I', 0, 14);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 1000000.00, 2000, 'S', 1, 1, 'O', 0, 15);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 250000.00, 2000, 'S', 1, 1, 'M', 0, 16);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -10 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 17);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -13 YEAR), 500000.00, 2000, 'S', 1, 1, 'U', 0, 18);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 2000000.00, 2000, 'S', 1, 1, 'M', 0, 20);
INSERT INTO ab_project.ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000000.00, 2000, 'S', 1, 1, 'O', 0, 21);

COMMIT;


-- Create ab_project.ab_Driver records
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'K3L 4B9', 'Raphael', NULL, 'Owens', '2021-02-14 15:36:27');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'P4U 5B4', 'Berk', 'D', 'Meadows', '2021-06-25 17:24:48');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'R2B 3A4', 'Jonah', NULL, 'Potts', '2020-08-29 20:25:25');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'X9B 0H6', 'Patience', NULL, 'Nelson', '2020-09-10 02:06:27');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'S0I 2S3', 'Morgan', 'B', 'Brennan', '2020-09-04 11:29:41');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'A9M 4Q6', 'Kristen', NULL, 'Dudley', '1990-11-03 23:32:21');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'Z2D 4D3', 'Randall', 'R', 'Mcbride', '2000-09-14 05:25:04');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'Z2X 2Y1', 'Merrill', NULL, 'Waters', '2001-05-06 04:01:02');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'T0W 3X6', 'Alec', NULL, 'Estrada', '1980-08-30 14:37:30');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'F1U 5Y6', 'Steve', 'M', 'Guy', '1985-09-20 00:00:00');
INSERT INTO ab_project.ab_driver
	(license, fname, mname, lname, birthdate)
VALUES
	( 'F1U 5Y7', 'Lucy', 'F', 'Chick', '2000-09-09 06:30:00');

COMMIT;

-- Create ab_project.ab_Vehicle records

INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '628047588812090', 'Honda', 'Civic', 2012, 'O', 1);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '232743502846810', 'Honda', 'Accord', 2019, 'L', 2);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '777460265379710', 'Tesla', 'Model 3', 2000, 'F', 3);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '013385760649101', 'Tesla', 'Model S', 1990, 'O', 4);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '654499508054630', 'Audi', 'A8', 1995, 'L', 5);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '496486322739760', 'Audi', 'A6', 2000, 'L', 6);
INSERT INTO ab_project.ab_vehicle
	(vin, make, model, year, state, policy_id)
VALUES
	( '298326397808910', 'Mazda', 'Miata', 1980, 'O', 8);

-- cfeate ab_project.ab_DRIVER_VEHILCE records

INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'K3L 4B9', '628047588812090');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	(  'P4U 5B4', '232743502846810');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'R2B 3A4', '777460265379710');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'X9B 0H6', '013385760649101');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'T0W 3X6', '654499508054630');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'F1U 5Y6', '496486322739760');
INSERT INTO ab_project.ab_driver_vehicle
	(license, vin)
VALUES
	( 'F1U 5Y7', '298326397808910');

-- CREATE ab_project.ab_INVOICE RECORDS

INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(6341841,"2021-05-11 03:28:43","6466.74","2021-03-25 09:34:57","738.35",0,8);
INSERT INTO ab_project.ab_invoice
(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(6375949,"2020-09-04 00:35:36","2089.72","2020-09-11 20:21:11","298.77",1,12);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(435513,"2020-11-19 23:22:12","5572.22","2020-09-13 08:40:27","998.58",0,10);
INSERT INTO ab_project.ab_invoice
(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(4821965,"2020-12-13 09:58:36","5247.20","2020-09-13 15:13:12","156.12",1,15);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(8798943,"2021-07-19 20:37:17","5491.30","2021-07-18 23:33:13","891.48",0,19);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(879003,"2020-11-29 01:43:54","1155.29","2021-03-29 21:46:12","631.54",1,12);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(3984561,"2020-09-02 14:45:43","6974.45","2021-02-10 00:50:43","769.10",0,6);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(2932905,"2020-08-06 06:03:11","3130.73","2020-10-16 19:24:14","117.46",0,12);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(5918869,"2021-04-01 00:39:51","2229.73","2021-07-05 08:34:25","785.56",1,17);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(8045261,"2021-02-13 11:17:39","3539.08","2021-06-28 03:40:31","469.49",0,16);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(7308349,"2020-10-18 03:03:01","1333.44","2020-11-01 20:17:20","739.16",0,7);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(6238400,"2020-08-24 16:52:28","1713.31","2020-08-25 22:11:33","119.99",1,9);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(183347,"2021-02-07 00:58:41","4129.73","2020-09-12 04:22:52","836.25",0,15);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(3132230,"2021-04-28 00:49:58","3361.45","2021-01-28 19:56:20","283.68",1,6);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(2515970,"2020-09-20 05:49:50","2691.34","2021-05-16 21:22:17","962.56",1,13);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(1071562,"2021-05-08 22:50:11","9202.28","2021-05-16 08:41:44","170.70",1,5);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(5921532,"2021-04-21 01:31:14","6068.50","2021-04-26 04:20:07","987.32",1,15);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(2795747,"2021-03-18 14:45:16","7546.56","2020-08-25 16:23:48","881.80",0,2);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(9273101,"2021-05-08 11:06:11","6820.46","2021-05-30 09:49:41","471.18",1,1);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(1846222,"2020-07-30 16:32:45","6035.68","2020-10-03 16:46:53","692.43",1,1);
INSERT INTO ab_project.ab_invoice
	(invoice_id,invoice_date,amount,payment_date,total_paid,active,policy_id)
VALUES
	(5877124,"2021-05-20 21:55:13","9118.48","2021-02-25 08:36:53","622.81",0,13);

-- CREATE ab_project.ab_PAYMENT RECORDS

INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-05-27 06:40:24","7866.05","PayPal",6341841);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-01-28 22:34:18","8130.53","PayPal",5921532);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-03-20 22:18:33","4130.77","Debit",2795747);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-04-24 03:33:12","1535.49","PayPal",1846222);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-10-25 04:58:00","6570.28","Check",1846222);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-12-28 19:12:03","4258.54","Credit",5877124);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-02-01 07:28:50","4473.05","Check",3132230);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-10-26 13:07:34","936.56","PayPal",6238400);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-12-13 23:20:22","7760.62","PayPal",6375949);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-03-10 04:36:05","4781.91","PayPal",435513);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-07-15 18:53:46","1703.17","Credit",4821965);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-01-28 09:49:01","8697.58","Credit",8798943);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-08-18 11:23:53","7820.75","Debit",879003);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-07-14 03:25:05","407.92","Check",3984561);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-08-02 21:45:43","3507.55","PayPal",2932905);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-07-05 05:55:37","361.29","Debit",5918869);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-06-15 13:17:07","2754.62","PayPal",8045261);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-08-29 06:55:23","9276.79","Check",7308349);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-02-11 21:49:15","1289.55","PayPal",6238400);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2021-07-25 13:13:18","5385.38","Debit",183347);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-08-04 14:09:23","5945.09","Check",3132230);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES
	("2020-08-26 04:37:02","8912.51","Credit",2515970);
INSERT INTO ab_project.ab_payment
	(pay_date,amount,pay_type,invoice_id)
VALUES ("2021-02-06 02:52:41","7339.07","Credit",1071562);

COMMIT;
