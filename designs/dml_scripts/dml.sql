USE ab_project;

INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(1, 'Alex', NULL, 'Biehl', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(2, 'Nick', 'E', 'Biehl', 'M', 'S', 'AH', '123 Some Street', 'APT B', 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(3, 'Joe', NULL, 'Schmo', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(4, 'Tom', NULL, 'Bob', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(5, 'Richard', NULL, 'Long', 'M', 'M', 'H', '129 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(6, 'Harry', NULL, 'Mo', 'M', 'M', 'H', '123 Some Street', 'APT C', 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(7, 'Abel', NULL, 'Tutor', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(8, 'Abraham', NULL, 'Lincoln', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(9, 'Melissa', 'R', 'Pena', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(10, 'Mathew', NULL, 'Taylor', 'M', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(11, 'Chris', NULL, 'Harris', 'M', 'M', 'H', '123 Some Street', 'APT D', 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(12, 'Nirali', NULL, 'Patel', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(13, 'Madonna', NULL, 'Cosby', 'F', 'W', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(14, 'Neva', NULL, 'Marsell', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(15, 'Tia', NULL, 'Lino', 'F', 'M', 'H', '223 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(16, 'Gayla', NULL, 'Gaimer', 'F', 'M', 'H', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(17, 'Trey', NULL, 'Trout', 'M', 'M', 'H', '153 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(18, 'Rosemarie', NULL, 'Fields', 'F', 'M', 'AH', '123 Some Street', NULL, 'Anytown', 'CA', '00000');
INSERT INTO ab_customer 
	(cust_id, fname, mname, lname, gender, marital_status, cust_type, street_1, street_2, city, state, zip) 
VALUES
	(19, 'Teri', NULL, 'Erlwile', 'F', 'S', 'AH', '126Some Street', NULL, 'Anytown', 'CA', '00000');
    
COMMIT;

-- ab policy inserts

INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(1, 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL 0 YEAR), 1000.00, 'C', 1, 1);
INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(2, 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL 0 YEAR), 1000.00, 'C', 1, 2);
INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(3, 'AH', ADDDATE(SYSDATE(), INTERVAL -5 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 3);
INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(4, 'A', ADDDATE(SYSDATE(), INTERVAL -2 YEAR), ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000.00, 'P', 0, 4);
INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(5, 'AH', ADDDATE(SYSDATE(), INTERVAL -10 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 4);
INSERT INTO ab_policy
	(policy_id, p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	(6, 'AH', ADDDATE(SYSDATE(), INTERVAL -10 YEAR), ADDDATE(SYSDATE(), INTERVAL -5 YEAR), 1000.00, 'P', 0, 5);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 5);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 6);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 7);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 8);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 9);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 10);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'H', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 11);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 12);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 13);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 14);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 15);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 16);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'A', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 1);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -1 YEAR), ADDDATE(SYSDATE(), INTERVAL -0 YEAR), 1000.00, 'C', 1, 17);
INSERT INTO ab_policy
	(p_type, start_date, end_date, premium, state, active, cust_id)
VALUES
	( 'AH', ADDDATE(SYSDATE(), INTERVAL -7 YEAR), ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 1000.00, 'P', 0, 18);
    
COMMIT;
    
-- insert values into ab_home and ab_auto for their respective policies

INSERT INTO ab_home (policy_id) VALUES (1);
INSERT INTO ab_home (policy_id) VALUES (2);
INSERT INTO ab_home (policy_id) VALUES (3);
INSERT INTO ab_home (policy_id) VALUES (5);
INSERT INTO ab_home (policy_id) VALUES (6);
INSERT INTO ab_home (policy_id) VALUES (7);
INSERT INTO ab_home (policy_id) VALUES (9);
INSERT INTO ab_home (policy_id) VALUES (10);
INSERT INTO ab_home (policy_id) VALUES (12);
INSERT INTO ab_home (policy_id) VALUES (13);
INSERT INTO ab_home (policy_id) VALUES (14);
INSERT INTO ab_home (policy_id) VALUES (15);
INSERT INTO ab_home (policy_id) VALUES (16);
INSERT INTO ab_home (policy_id) VALUES (17);
INSERT INTO ab_home (policy_id) VALUES (18);
INSERT INTO ab_home (policy_id) VALUES (20);
INSERT INTO ab_home (policy_id) VALUES (21);

INSERT INTO ab_auto (policy_id) VALUES (1);
INSERT INTO ab_auto (policy_id) VALUES (2);
INSERT INTO ab_auto (policy_id) VALUES (3);
INSERT INTO ab_auto (policy_id) VALUES (4);
INSERT INTO ab_auto (policy_id) VALUES (5);
INSERT INTO ab_auto (policy_id) VALUES (6);
INSERT INTO ab_auto (policy_id) VALUES (8);
INSERT INTO ab_auto (policy_id) VALUES (9);
INSERT INTO ab_auto (policy_id) VALUES (11);
INSERT INTO ab_auto (policy_id) VALUES (12);
INSERT INTO ab_auto (policy_id) VALUES (14);
INSERT INTO ab_auto (policy_id) VALUES (15);
INSERT INTO ab_auto (policy_id) VALUES (16);
INSERT INTO ab_auto (policy_id) VALUES (17);
INSERT INTO ab_auto (policy_id) VALUES (18);
INSERT INTO ab_auto (policy_id) VALUES (19);
INSERT INTO ab_auto (policy_id) VALUES (20);
INSERT INTO ab_auto (policy_id) VALUES (21);

COMMIT;

-- INSERT INTO AB_HOUSE

INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 1);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 2500000.00, 2000, 'M', 1, 1, 'O', 0, 2);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -7 YEAR), 1500000.00, 2000, 'C', 1, 1, NULL, 0, 3);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -3 YEAR), 1000000.00, 2000, 'T', 1, 1, 'U', 0, 5);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -9 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 6);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -20 YEAR), 1000000.00, 2000, 'M', 1, 1, NULL, 0, 7);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -40 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 9);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -15 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 10);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -20 YEAR), 100000.00, 2000, 'S', 1, 1, NULL, 0, 12);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -3 YEAR), 1520000.00, 2000, 'S', 1, 1, NULL, 0, 13);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -8 YEAR), 5000000.00, 2000, 'S', 1, 1, 'I', 0, 14);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -2 YEAR), 1000000.00, 2000, 'S', 1, 1, 'O', 0, 15);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 250000.00, 2000, 'S', 1, 1, 'M', 0, 16);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -10 YEAR), 1000000.00, 2000, 'S', 1, 1, NULL, 0, 17);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -13 YEAR), 500000.00, 2000, 'S', 1, 1, 'U', 0, 18);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 2000000.00, 2000, 'S', 1, 1, 'M', 0, 20);
INSERT INTO ab_house
	(purchase_date, purchase_value, area, house_type, auto_fire_notif, home_security, pool, basement, policy_id)
VALUES
	(ADDDATE(SYSDATE(), INTERVAL -1 YEAR), 1000000.00, 2000, 'S', 1, 1, 'O', 0, 21);
    
COMMIT;


