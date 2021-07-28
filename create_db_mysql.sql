-- SQLINES DEMO *** le SQL Developer Data Modeler 21.1.0.092.1221
-- SQLINES DEMO *** -07-26 17:34:54 EDT
-- SQLINES DEMO *** le Database 21c
-- SQLINES DEMO *** le Database 21c



-- SQLINES DEMO *** no DDL - MDSYS.SDO_GEOMETRY

-- SQLINES DEMO *** no DDL - XMLTYPE

CREATE DATABASE IF NOT EXISTS ab_project;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_auto;
CREATE TABLE ab_auto (
    policy_id INT NOT NULL COMMENT 'THE INSURANCE POLICY UNIQUE ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_auto.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID'; */

ALTER TABLE ab_auto ADD CONSTRAINT ab_auto_pk PRIMARY KEY ( policy_id );

ALTER TABLE ab_auto MODIFY COLUMN policy_id INT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_customer;
CREATE TABLE ab_customer (
    cust_id         INT NOT NULL COMMENT 'THE CUSTOMERS UNIQUE ID',
    fname           VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS FIRST NAME',
    mname           VARCHAR(1) COMMENT 'THE CUSTOMERS MIDDLE INITIAL',
    lname           VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS LAST NAME',
    gender          VARCHAR(1) COMMENT 'THE CUSTOMERS GENDER',
    marital_status  VARCHAR(1) NOT NULL COMMENT 'THE CUSTOMERS MARITAL STATUS. EITHER ''M'', ''S'', OR ''W''',
    cust_type       VARCHAR(1) NOT NULL COMMENT 'THE CUSTOMER TYPE. ''A'' AUTOMOBILE INSURANCE, ''H'' HOME INSURANCE.',
    street_1        VARCHAR(32) NOT NULL COMMENT 'CUSTOMERS STREET ADDRESS',
    street_2        VARCHAR(32) COMMENT 'OPTIONAL CUSTOMER FLOOR/APARTMENT.',
    city            VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS ADDRESS CITY.',
    state           VARCHAR(2) NOT NULL COMMENT 'THE CUSTOMERS HOME ADDRESS STATE CODE',
    zip             VARCHAR(5) NOT NULL COMMENT 'THE CUSTOMERS HOME ADDRESS ZIPCODE.'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.cust_id IS
    'THE CUSTOMERS UNIQUE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.fname IS
    'THE CUSTOMERS FIRST NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.mname IS
    'THE CUSTOMERS MIDDLE INITIAL'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.lname IS
    'THE CUSTOMERS LAST NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.gender IS
    'THE CUSTOMERS GENDER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.marital_status IS
    'THE CUSTOMERS MARITAL STATUS. EITHER ''M'', ''S'', OR ''W'''; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.cust_type IS
    'THE CUSTOMER TYPE. ''A'' AUTOMOBILE INSURANCE, ''H'' HOME INSURANCE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.street_1 IS
    'CUSTOMERS STREET ADDRESS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.street_2 IS
    'OPTIONAL CUSTOMER FLOOR/APARTMENT.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.city IS
    'THE CUSTOMERS ADDRESS CITY.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.state IS
    'THE CUSTOMERS HOME ADDRESS STATE CODE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.zip IS
    'THE CUSTOMERS HOME ADDRESS ZIPCODE.'; */

ALTER TABLE ab_customer ADD CONSTRAINT ab_customer_pk PRIMARY KEY ( cust_id );

ALTER TABLE ab_customer MODIFY COLUMN cust_id INT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_driver;
CREATE TABLE ab_driver (
    license    VARCHAR(16) NOT NULL COMMENT 'THE DRIVERS LICENSE NUMBER',
    fname      VARCHAR(32) NOT NULL COMMENT 'THE DRIVERS FIRST NAME.',
    mname      VARCHAR(1) COMMENT 'THE DRIVERS OPTIONAL MIDDLE INITIAL.',
    lname      VARCHAR(32) NOT NULL COMMENT 'THE DRIVERS LAST NAME.',
    birthdate  DATETIME NOT NULL COMMENT 'THE DRIVERS BIRTHDATE.'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver.license IS
    'THE DRIVERS LICENSE NUMBER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver.fname IS
    'THE DRIVERS FIRST NAME.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver.mname IS
    'THE DRIVERS OPTIONAL MIDDLE INITIAL.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver.lname IS
    'THE DRIVERS LAST NAME.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver.birthdate IS
    'THE DRIVERS BIRTHDATE.'; */

ALTER TABLE ab_driver ADD CONSTRAINT ab_driver_pk PRIMARY KEY ( license );

ALTER TABLE ab_driver MODIFY COLUMN license VARCHAR(16) UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_driver_vehicle;
CREATE TABLE ab_driver_vehicle (
    license  VARCHAR(16) NOT NULL COMMENT 'THE LICENSE OF THE CARS DRIVER',
    vin      VARCHAR(17) NOT NULL COMMENT 'THE VIN OF THE INSURED VEHICLE'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver_vehicle.license IS
    'THE LICENSE OF THE CARS DRIVER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver_vehicle.vin IS
    'THE VIN OF THE INSURED VEHICLE'; */

ALTER TABLE ab_driver_vehicle ADD CONSTRAINT ab_driver_vehicle_pk PRIMARY KEY ( license,
                                                                                vin );

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_home;
CREATE TABLE ab_home (
    policy_id INT NOT NULL COMMENT 'THE INSURANCE POLICY UNIQUE ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_home.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID'; */

ALTER TABLE ab_home ADD CONSTRAINT ab_home_pk PRIMARY KEY ( policy_id );

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_house;
CREATE TABLE ab_house (
    home_id          INT NOT NULL COMMENT 'THE UNIQUE HOME ID',
    purchase_date    DATETIME NOT NULL COMMENT 'THE DATE THE HOME WAS PURCHASED.',
    purchase_value   DECIMAL(9, 2) NOT NULL COMMENT 'THE HOMES PURCHASE VALUE.',
    area             DECIMAL(7, 2) NOT NULL COMMENT 'THE HOMES AREA IN SQUARE FEET.',
    type             VARCHAR(1) NOT NULL COMMENT 'THE HOME TYPE. ''S'' IS SINGLE FAMILY, ''M'' IS MULTI FAMILY, ''C'' IS CONDOMINIUM, ''T'' IS TOWN HOUSE.',
    auto_fire_notif  TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS AUTOMATIC FIRE NOTIFICATION TO THE FIRE DEPARTMENT.',
    home_security    TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS A SECURITY SYSTEM.',
    pool             VARCHAR(1) COMMENT 'SWIMMING POOL. ''U'' IS UNDERGROUND, ''O'' IS OVERGROUND, ''I'' IS INDOOR, ''M'' IS MULTIPLE, NULL IS NO POOL.',
    basement         TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS A BASEMENT.',
    policy_id        INT NOT NULL COMMENT 'THE ID OF THE POLICY INSURING THE HOUSE'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.home_id IS
    'THE UNIQUE HOME ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.purchase_date IS
    'THE DATE THE HOME WAS PURCHASED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.purchase_value IS
    'THE HOMES PURCHASE VALUE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.area IS
    'THE HOMES AREA IN SQUARE FEET.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.type IS
    'THE HOME TYPE. ''S'' IS SINGLE FAMILY, ''M'' IS MULTI FAMILY, ''C'' IS CONDOMINIUM, ''T'' IS TOWN HOUSE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.auto_fire_notif IS
    'WHETHER THE HOUSE HAS AUTOMATIC FIRE NOTIFICATION TO THE FIRE DEPARTMENT.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.home_security IS
    'WHETHER THE HOUSE HAS A SECURITY SYSTEM.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.pool IS
    'SWIMMING POOL. ''U'' IS UNDERGROUND, ''O'' IS OVERGROUND, ''I'' IS INDOOR, ''M'' IS MULTIPLE, NULL IS NO POOL.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.basement IS
    'WHETHER THE HOUSE HAS A BASEMENT.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_house.policy_id IS
    'THE ID OF THE POLICY INSURING THE HOUSE'; */

ALTER TABLE ab_house ADD CONSTRAINT ab_house_pk PRIMARY KEY ( home_id );

ALTER TABLE ab_house MODIFY COLUMN home_id INT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_invoice;
CREATE TABLE ab_invoice (
    invoice_id    INT NOT NULL COMMENT 'THE INVOICE ID',
    invoice_date  DATETIME NOT NULL COMMENT 'THE DATE GENERATED.',
    amount        DECIMAL(7, 2) NOT NULL COMMENT 'THE AMOUNT DUE',
    payment_date  DATETIME NOT NULL COMMENT 'THE DATE THE INVOICE IS DUE.',
    total_paid    DECIMAL(9, 2) NOT NULL COMMENT 'The amount that the client has paid so far.',
    active        TINYINT NOT NULL COMMENT 'WHETHER THE INVOICE IS ACTIVE',
    policy_id     INT NOT NULL COMMENT 'ID OF THE POLICY THAT THE INVOICE BELONGS TO'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.invoice_id IS
    'THE INVOICE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.invoice_date IS
    'THE DATE GENERATED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.amount IS
    'THE AMOUNT DUE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.payment_date IS
    'THE DATE THE INVOICE IS DUE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.total_paid IS
    'The amount that the client has paid so far.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.active IS
    'WHETHER THE INVOICE IS ACTIVE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_invoice.policy_id IS
    'ID OF THE POLICY THAT THE INVOICE BELONGS TO'; */

ALTER TABLE ab_invoice ADD CONSTRAINT ab_invoice_pk PRIMARY KEY ( invoice_id );

ALTER TABLE ab_invoice MODIFY COLUMN invoice_id INT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_payment;
CREATE TABLE ab_payment (
    p_id        BIGINT NOT NULL COMMENT 'THE PAYMENT ID',
    pay_date    DATETIME NOT NULL COMMENT 'THE DATE THE PAYMENT WAS MADE',
    amount      DECIMAL(7, 2) NOT NULL COMMENT 'THE PAYMENT INSTALLMENT AMOUNT.',
    type        VARCHAR(6) NOT NULL COMMENT 'THE METHOD OF PAYMENT; ONE OF ''PayPal'', ''Credit'', ''Debit'', OR ''Check''.',
    invoice_id  INT NOT NULL COMMENT 'THE INVOICE THE PAYMENT IS GOING TOWARDS'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.p_id IS
    'THE PAYMENT ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.pay_date IS
    'THE DATE THE PAYMENT WAS MADE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.amount IS
    'THE PAYMENT INSTALLMENT AMOUNT.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.type IS
    'THE METHOD OF PAYMENT; ONE OF ''PayPal'', ''Credit'', ''Debit'', OR ''Check''.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.invoice_id IS
    'THE INVOICE THE PAYMENT IS GOING TOWARDS'; */

ALTER TABLE ab_payment ADD CONSTRAINT ab_payment_pk PRIMARY KEY ( p_id );

ALTER TABLE ab_payment MODIFY COLUMN P_id BIGINT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_policy;
CREATE TABLE ab_policy (
    policy_id   INT NOT NULL COMMENT 'THE INSURANCE POLICY UNIQUE ID',
    type        VARCHAR(9) NOT NULL COMMENT 'THE POLICY TYPE. ''A'' FOR AUTO AND ''H'' FOR HOME.',
    start_date  DATETIME NOT NULL COMMENT 'THE POLICY START DATE',
    end_date    DATETIME NOT NULL COMMENT 'THE POLICY END DATE.',
    premium     DECIMAL(7, 2) NOT NULL COMMENT 'THE PREMIUM AMOUNT.',
    status      VARCHAR(1) NOT NULL COMMENT 'THE POLICY STATUS. ''C'' FOR CURRENT, ''P'' FOR EXPIRED.',
    active      TINYINT NOT NULL COMMENT 'WHETHER THE POLICY IS STILL ACTIVE',
    cust_id     INT NOT NULL COMMENT 'ID OF THE CUSTOMER HOLDING THE POLICY'
);

ALTER TABLE ab_policy
    ADD CONSTRAINT ch_inh_ab_policy CHECK ( type IN ( 'A', 'H' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.type IS
    'THE POLICY TYPE. ''A'' FOR AUTO AND ''H'' FOR HOME.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.start_date IS
    'THE POLICY START DATE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.end_date IS
    'THE POLICY END DATE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.premium IS
    'THE PREMIUM AMOUNT.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.status IS
    'THE POLICY STATUS. ''C'' FOR CURRENT, ''P'' FOR EXPIRED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.active IS
    'WHETHER THE POLICY IS STILL ACTIVE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.cust_id IS
    'ID OF THE CUSTOMER HOLDING THE POLICY'; */

ALTER TABLE ab_policy ADD CONSTRAINT ab_policy_pk PRIMARY KEY ( policy_id );

ALTER TABLE ab_policy MODIFY COLUMN policy_id INT AUTO_INCREMENT UNIQUE;

USE ab_project;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_vehicle;
CREATE TABLE ab_vehicle (
    vin        VARCHAR(17) NOT NULL COMMENT 'THE VEHICLE IDENTIFICATION NUMBER',
    make       VARCHAR(32) NOT NULL COMMENT 'THE VEHICLE MAKE.',
    model      VARCHAR(32) NOT NULL COMMENT 'THE VEHICLE MODEL.',
    year       SMALLINT NOT NULL COMMENT 'THE VEHICLE YEAR.',
    status     VARCHAR(1) NOT NULL COMMENT 'VEHICLE STATUS. ''L'' IS LEASED, ''F'' IS FINANCED, AND ''O'' IS OWNED.',
    policy_id  INT NOT NULL COMMENT 'THE ID OF THE POLICY INSURING THE CAR'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.vin IS
    'THE VEHICLE IDENTIFICATION NUMBER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.make IS
    'THE VEHICLE MAKE.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.model IS
    'THE VEHICLE MODEL.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.year IS
    'THE VEHICLE YEAR.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.status IS
    'VEHICLE STATUS. ''L'' IS LEASED, ''F'' IS FINANCED, AND ''O'' IS OWNED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.policy_id IS
    'THE ID OF THE POLICY INSURING THE CAR'; */

ALTER TABLE ab_vehicle ADD CONSTRAINT ab_vehicle_pk PRIMARY KEY ( vin );

ALTER TABLE ab_vehicle MODIFY COLUMN vin VARCHAR(17)  UNIQUE;

ALTER TABLE ab_auto
    ADD CONSTRAINT ab_auto_ab_policy_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_policy ( policy_id );

ALTER TABLE ab_driver_vehicle
    ADD CONSTRAINT ab_driver_ab_vehicle_fk FOREIGN KEY ( vin )
        REFERENCES ab_vehicle ( vin )
            ON DELETE CASCADE;

ALTER TABLE ab_driver_vehicle
    ADD CONSTRAINT ab_driver_vehicle_ab_driver_fk FOREIGN KEY ( license )
        REFERENCES ab_driver ( license )
            ON DELETE CASCADE;

ALTER TABLE ab_home
    ADD CONSTRAINT ab_home_ab_policy_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_policy ( policy_id );

ALTER TABLE ab_house
    ADD CONSTRAINT ab_house_ab_home_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_home ( policy_id );

ALTER TABLE ab_invoice
    ADD CONSTRAINT ab_invoice_ab_policy_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_policy ( policy_id );

ALTER TABLE ab_payment
    ADD CONSTRAINT ab_payment_ab_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES ab_invoice ( invoice_id );

ALTER TABLE ab_policy
    ADD CONSTRAINT ab_policy_ab_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES ab_customer ( cust_id );

ALTER TABLE ab_vehicle
    ADD CONSTRAINT ab_vehicle_ab_auto_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_auto ( policy_id );


-- custom constraints

ALTER TABLE ab_customer
    ADD CONSTRAINT c_customer_cust_id
        CHECK (cust_id BETWEEN 0 AND 9999999);

ALTER TABLE ab_policy
    ADD CONSTRAINT c_policy_policy_id
        CHECK (policy_id BETWEEN 0 AND 9999999);

ALTER TABLE ab_invoice
    ADD CONSTRAINT c_invoice_invoice_id
        CHECK (invoice_id BETWEEN 0 AND 9999999);

ALTER TABLE ab_payment
    ADD CONSTRAINT c_payment_p_id
        CHECK (p_id BETWEEN 0 AND 999999999);

ALTER TABLE ab_house
    ADD CONSTRAINT c_house_home_id
        CHECK (home_id BETWEEN 0 AND 9999999);

-- SQLINES DEMO *** aints

delimiter |

DROP TRIGGER IF EXISTS arc_fkarc_2_ab_home |
CREATE TRIGGER arc_fkarc_2_ab_home BEFORE
    INSERT ON ab_home
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(9);
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = new.policy_id;

    IF  d IS NULL OR d <> 'H' THEN
			-- set msg = 'FK AB_HOME_AB_POLICY_FK in Table AB_HOME violates Arc constraint on Table AB_POLICY - discriminator column TYPE doesn''t have value ''H''';
			signal sqlstate '45000'
				SET message_text = 'Cannot associate a home with an insurance policy without type ''H''';
    END if ;

    -- DECLARE EXIT HANDLER FOR not found BEGIN
        -- NULL;
    -- END;
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        -- RESIGNAL;
    -- END;
END 
|
delimiter ;

DELIMITER |

DROP TRIGGER IF EXISTS arc_fkarc_2_ab_home |
CREATE TRIGGER arc_fkarc_2_ab_home BEFORE
    UPDATE ON ab_home
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(9);
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = new.policy_id;

    IF ( d IS NULL OR d <> 'H' ) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Cannot associate a home with an insurance policy without type ''H''';
    END IF;

    -- DECLARE EXIT HANDLER FOR not found BEGIN
        -- NULL;
    -- END;
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        -- RESIGNAL;
    -- END;
END
|
DELIMITER ;

DELIMITER |

DROP TRIGGER IF EXISTS arc_fkarc_2_ab_auto |
CREATE TRIGGER arc_fkarc_2_ab_auto BEFORE
    INSERT ON ab_auto
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(9);
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = new.policy_id;

    IF ( d IS NULL OR d <> 'A' ) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Cannot associate a vehilce with an insurance policy without type ''A''';
    END IF;

    -- DECLARE EXIT HANDLER FOR not found BEGIN
        -- NULL;
    -- END;
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        -- RESIGNAL;
    -- END;
END
 |
 
 DELIMITER ;
 
 DELIMITER |
 
DROP TRIGGER IF EXISTS arc_fkarc_2_ab_auto |
CREATE TRIGGER arc_fkarc_2_ab_auto BEFORE
    UPDATE ON ab_auto
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(9);
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = new.policy_id;

    IF ( d IS NULL OR d <> 'A' ) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Cannot associate a vehicle with an insurance policy without type ''A''';
    END IF;

    -- DECLARE EXIT HANDLER FOR not found BEGIN
        -- NULL;
    -- END;
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        -- RESIGNAL;
    -- END;
END
|

DELIMITER ;

DELIMITER |

DROP TRIGGER IF EXISTS tr_policy_insert_end_date |
CREATE TRIGGER tr_policy_insert_end_date BEFORE
	INSERT ON ab_policy
    FOR EACH ROW
BEGIN
	DECLARE d DATETIME;
    SELECT
		a.start_date
	INTO d
    FROM
		ab_policy a
	WHERE
		a.policy_id = NEW.policy_id;
	
    IF (d IS NOT NULL AND d > NEW.end_date) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: The end date cannot be before the start date';
	END IF;
END
|

DROP TRIGGER IF EXISTS tr_policy_update_end_date |
CREATE TRIGGER tr_policy_update_end_date BEFORE
	UPDATE ON ab_policy
    FOR EACH ROW
BEGIN
	DECLARE d DATETIME;
    SELECT
		a.start_date
	INTO d
    FROM
		ab_policy a
	WHERE
		a.policy_id = NEW.policy_id;
	
    IF (d IS NOT NULL AND d > NEW.end_date) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: The end date cannot be before the start date';
	END IF;
END
|

DROP TRIGGER IF EXISTS tr_policy_insert_start_date |
CREATE TRIGGER tr_policy_insert_start_date BEFORE
	INSERT ON ab_policy
    FOR EACH ROW
BEGIN
	DECLARE d DATETIME;
    SELECT
		a.end_date
	INTO d
    FROM
		ab_policy a
	WHERE
		a.policy_id = NEW.policy_id;
        
	IF (d IS NOT NULL AND d < NEW.start_date) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: The Start date cannot be before the end date';
	END IF;
END
|

DROP TRIGGER IF EXISTS tr_policy_update_start_date |
CREATE TRIGGER tr_policy_update_start_date BEFORE
	UPDATE ON ab_policy
    FOR EACH ROW
BEGIN
	DECLARE d DATETIME;
    SELECT
		a.end_date
	INTO d
    FROM
		ab_policy a
	WHERE
		a.policy_id = NEW.policy_id;
        
	IF (d IS NOT NULL AND d < NEW.start_date) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: The Start date cannot be before the end date';
	END IF;
END
|
    
DELIMITER ;


-- SQLINES DEMO *** per Data Modeler Summary Report: 
-- 
-- SQLINES DEMO ***                        10
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                        20
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** DY                      0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         2
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE BODY              0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** EGMENT                  0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** ED VIEW                 0
-- SQLINES DEMO *** ED VIEW LOG             0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** A                       0
-- SQLINES DEMO *** T                       0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
