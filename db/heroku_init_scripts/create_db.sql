-- SQLINES DEMO *** le SQL Developer Data Modeler 21.1.0.092.1221
-- SQLINES DEMO *** -08-04 18:11:42 EDT
-- SQLINES DEMO *** le Database 21c
-- SQLINES DEMO *** le Database 21c



-- SQLINES DEMO *** no DDL - MDSYS.SDO_GEOMETRY

-- SQLINES DEMO *** no DDL - XMLTYPE
-- DROP DATABASE IF EXISTS l1ytx0br27o7wepw;
CREATE DATABASE IF NOT EXISTS l1ytx0br27o7wepw;

USE l1ytx0br27o7wepw;

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

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_customer;
CREATE TABLE ab_customer (
    user_id         INT NOT NULL COMMENT 'THE USER UNIQUE IDENTIFIER',
    fname           VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS FIRST NAME',
    mname           VARCHAR(1) COMMENT 'THE CUSTOMERS MIDDLE INITIAL',
    lname           VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS LAST NAME',
    gender          VARCHAR(1) COMMENT 'THE CUSTOMERS GENDER',
    marital_status  VARCHAR(1) NOT NULL COMMENT 'THE CUSTOMERS MARITAL STATUS. EITHER ''M'', ''S'', OR ''W''',
    cust_type       VARCHAR(2) COMMENT 'THE CUSTOMER TYPE. ''A'' AUTOMOBILE INSURANCE, ''H'' HOME INSURANCE.',
    street_1        VARCHAR(32) NOT NULL COMMENT 'CUSTOMERS STREET ADDRESS',
    street_2        VARCHAR(32) COMMENT 'OPTIONAL CUSTOMER FLOOR/APARTMENT.',
    city            VARCHAR(32) NOT NULL COMMENT 'THE CUSTOMERS ADDRESS CITY.',
    state           VARCHAR(2) NOT NULL COMMENT 'THE CUSTOMERS HOME ADDRESS STATE CODE',
    zip             VARCHAR(5) NOT NULL COMMENT 'THE CUSTOMERS HOME ADDRESS ZIPCODE.'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_customer.user_id IS
    'THE USER UNIQUE IDENTIFIER'; */

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

ALTER TABLE ab_customer ADD CONSTRAINT ab_customer_pk PRIMARY KEY ( user_id );

USE l1ytx0br27o7wepw;

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

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_driver_vehicle;
CREATE TABLE ab_driver_vehicle (
    license  VARCHAR(16) NOT NULL COMMENT 'LICENSE OF THE DRIVER OF THE CAR',
    vin      VARCHAR(17) NOT NULL COMMENT 'VEHICLE IDENTIFICATION NUMBER OF THE DRIVEN CAR'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver_vehicle.license IS
    'LICENSE OF THE DRIVER OF THE CAR'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_driver_vehicle.vin IS
    'VEHICLE IDENTIFICATION NUMBER OF THE DRIVEN CAR'; */

ALTER TABLE ab_driver_vehicle ADD CONSTRAINT ab_driver_vehicle_pk PRIMARY KEY ( license,
                                                                                vin );

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_home;
CREATE TABLE ab_home (
    policy_id INT NOT NULL COMMENT 'THE INSURANCE POLICY UNIQUE ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_home.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID'; */

ALTER TABLE ab_home ADD CONSTRAINT ab_home_pk PRIMARY KEY ( policy_id );

USE l1ytx0br27o7wepw;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_house;
CREATE TABLE ab_house (
    home_id          INT NOT NULL COMMENT 'THE UNIQUE HOME ID',
    purchase_date    DATETIME NOT NULL COMMENT 'THE DATE THE HOME WAS PURCHASED.',
    purchase_value   DECIMAL(9, 2) NOT NULL COMMENT 'THE HOMES PURCHASE VALUE.',
    area             DECIMAL(7, 2) NOT NULL COMMENT 'THE HOMES AREA IN SQUARE FEET.',
    house_type       VARCHAR(1) NOT NULL COMMENT 'THE HOME TYPE. ''S'' IS SINGLE FAMILY, ''M'' IS MULTI FAMILY, ''C'' IS CONDOMINIUM, ''T'' IS TOWN HOUSE.',
    auto_fire_notif  TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS AUTOMATIC FIRE NOTIFICATION TO THE FIRE DEPARTMENT.',
    home_security    TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS A SECURITY SYSTEM.',
    pool             VARCHAR(1) COMMENT 'SWIMMING POOL. ''U'' IS UNDERGROUND, ''O'' IS OVERGROUND, ''I'' IS INDOOR, ''M'' IS MULTIPLE, NULL IS NO POOL.',
    basement         TINYINT NOT NULL COMMENT 'WHETHER THE HOUSE HAS A BASEMENT.',
    policy_id        INT NOT NULL COMMENT 'THE POLICY THAT THIS HOME IS ATTACHED TO'
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
COMMENT ON COLUMN ab_house.house_type IS
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
    'THE POLICY THAT THIS HOME IS ATTACHED TO'; */

ALTER TABLE ab_house ADD CONSTRAINT ab_house_pk PRIMARY KEY ( home_id );

ALTER TABLE ab_house MODIFY COLUMN home_id INT AUTO_INCREMENT UNIQUE;

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_invoice;
CREATE TABLE ab_invoice (
    invoice_id    INT NOT NULL COMMENT 'THE INVOICE ID',
    invoice_date  DATETIME NOT NULL COMMENT 'THE DATE GENERATED.',
    amount        DECIMAL(7, 2) NOT NULL COMMENT 'THE AMOUNT DUE',
    payment_date  DATETIME NOT NULL COMMENT 'THE DATE THE INVOICE IS DUE.',
    total_paid    DECIMAL(9, 2) NOT NULL COMMENT 'The amount that the client has paid so far.',
    active        TINYINT NOT NULL COMMENT 'WHETHER THE INVOICE IS ACTIVE',
    policy_id     INT NOT NULL COMMENT 'THE POLICY THIS INVOICE BELONGS TO'
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
    'THE POLICY THIS INVOICE BELONGS TO'; */

ALTER TABLE ab_invoice ADD CONSTRAINT ab_invoice_pk PRIMARY KEY ( invoice_id );

ALTER TABLE ab_invoice MODIFY COLUMN invoice_id INT AUTO_INCREMENT UNIQUE;

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_payment;
CREATE TABLE ab_payment (
    p_id        BIGINT NOT NULL COMMENT 'THE PAYMENT ID',
    pay_date    DATETIME NOT NULL COMMENT 'THE DATE THE PAYMENT WAS MADE',
    amount      DECIMAL(7, 2) NOT NULL COMMENT 'THE PAYMENT INSTALLMENT AMOUNT.',
    pay_type    VARCHAR(6) NOT NULL COMMENT 'THE METHOD OF PAYMENT; ONE OF ''PayPal'', ''Credit'', ''Debit'', OR ''Check''.',
    invoice_id  INT NOT NULL COMMENT 'THE INVOICE THIS PAYMENT BELONGS TO'
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
COMMENT ON COLUMN ab_payment.pay_type IS
    'THE METHOD OF PAYMENT; ONE OF ''PayPal'', ''Credit'', ''Debit'', OR ''Check''.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_payment.invoice_id IS
    'THE INVOICE THIS PAYMENT BELONGS TO'; */

ALTER TABLE ab_payment ADD CONSTRAINT ab_payment_pk PRIMARY KEY ( p_id );

ALTER TABLE ab_payment MODIFY COLUMN p_id BIGINT AUTO_INCREMENT UNIQUE;

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_policy;
CREATE TABLE ab_policy (
    policy_id   INT NOT NULL COMMENT 'THE INSURANCE POLICY UNIQUE ID',
    p_type      VARCHAR(9) NOT NULL COMMENT 'THE POLICY TYPE. ''A'' FOR AUTO AND ''H'' FOR HOME.',
    start_date  DATETIME NOT NULL COMMENT 'THE POLICY START DATE',
    end_date    DATETIME NOT NULL COMMENT 'THE POLICY END DATE.',
    premium     DECIMAL(7, 2) NOT NULL COMMENT 'THE PREMIUM AMOUNT.',
    state       VARCHAR(1) NOT NULL COMMENT 'THE POLICY STATUS. ''C'' FOR CURRENT, ''P'' FOR EXPIRED.',
    active      TINYINT NOT NULL COMMENT 'WHETHER THE POLICY IS STILL ACTIVE',
    user_id     INT NOT NULL COMMENT 'THE ID OF THE USER WHO OWNS THE POLICY'
);

ALTER TABLE ab_policy
    ADD CONSTRAINT ch_inh_ab_policy CHECK ( p_type IN ( 'A', 'H', 'AH' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.p_type IS
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
COMMENT ON COLUMN ab_policy.state IS
    'THE POLICY STATUS. ''C'' FOR CURRENT, ''P'' FOR EXPIRED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.active IS
    'WHETHER THE POLICY IS STILL ACTIVE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_policy.user_id IS
    'THE ID OF THE USER WHO OWNS THE POLICY'; */

ALTER TABLE ab_policy ADD CONSTRAINT ab_policy_pk PRIMARY KEY ( policy_id );

ALTER TABLE ab_policy MODIFY COLUMN policy_id INT AUTO_INCREMENT UNIQUE;

USE l1ytx0br27o7wepw;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_role;
CREATE TABLE ab_role (
    role_id  INT NOT NULL COMMENT 'THE UNIQUE ROLE ID',
    name     VARCHAR(32) NOT NULL COMMENT 'THE ROLE NAME',
    `DESC`   VARCHAR(400) COMMENT 'THE OPTIONAL ROLE DESCRIPTION'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_role.role_id IS
    'THE UNIQUE ROLE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_role.name IS
    'THE ROLE NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_role."DESC" IS
    'THE OPTIONAL ROLE DESCRIPTION'; */

ALTER TABLE ab_role ADD CONSTRAINT ab_role_pk PRIMARY KEY ( role_id );

ALTER TABLE ab_role MODIFY COLUMN role_id INT AUTO_INCREMENT UNIQUE;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_user;
CREATE TABLE ab_user (
    user_id    INT NOT NULL COMMENT 'THE USER UNIQUE IDENTIFIER',
    user_name  VARCHAR(32) NOT NULL COMMENT 'THE USER LOGIN NAME',
    email      VARCHAR(32) NOT NULL COMMENT 'THE USER EMAIL ADDRESS',
    password   VARCHAR(128) NOT NULL COMMENT 'THE USER PASSWORD',
    type       VARCHAR(7) NOT NULL COMMENT 'THE USER TYPE'
);

ALTER TABLE ab_user
    ADD CONSTRAINT ch_inh_ab_user CHECK ( type IN ( 'E', 'C' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user.user_id IS
    'THE USER UNIQUE IDENTIFIER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user.user_name IS
    'THE USER LOGIN NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user.email IS
    'THE USER EMAIL ADDRESS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user.password IS
    'THE USER PASSWORD'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user.type IS
    'THE USER TYPE'; */

ALTER TABLE ab_user ADD CONSTRAINT ab_user_pk PRIMARY KEY ( user_id );

ALTER TABLE ab_user MODIFY COLUMN user_id INT AUTO_INCREMENT UNIQUE;

ALTER TABLE ab_user MODIFY COLUMN user_name varchar(32) UNIQUE;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_user_role_mtom;
CREATE TABLE ab_user_role_mtom (
    role_id  INT NOT NULL COMMENT 'THE ROLE THE USER HAS BEEN GIVEN',
    user_id  INT NOT NULL COMMENT 'THE USER THAT HAS THE ROLE'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user_role_mtom.role_id IS
    'THE ROLE THE USER HAS BEEN GIVEN'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_user_role_mtom.user_id IS
    'THE USER THAT HAS THE ROLE'; */

ALTER TABLE ab_user_role_mtom ADD CONSTRAINT ab_user_role_mtom_pk PRIMARY KEY ( role_id,
                                                                                user_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
DROP TABLE IF EXISTS ab_vehicle;
CREATE TABLE ab_vehicle (
    vin        VARCHAR(17) NOT NULL COMMENT 'THE VEHICLE IDENTIFICATION NUMBER',
    make       VARCHAR(32) NOT NULL COMMENT 'THE VEHICLE MAKE.',
    model      VARCHAR(32) NOT NULL COMMENT 'THE VEHICLE MODEL.',
    year       SMALLINT NOT NULL COMMENT 'THE VEHICLE YEAR.',
    state      VARCHAR(1) NOT NULL COMMENT 'VEHICLE STATUS. ''L'' IS LEASED, ''F'' IS FINANCED, AND ''O'' IS OWNED.',
    policy_id  INT NOT NULL COMMENT 'THE POLICY THAT THIS CAR IS ATTACHED TO'
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
COMMENT ON COLUMN ab_vehicle.state IS
    'VEHICLE STATUS. ''L'' IS LEASED, ''F'' IS FINANCED, AND ''O'' IS OWNED.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ab_vehicle.policy_id IS
    'THE POLICY THAT THIS CAR IS ATTACHED TO'; */

ALTER TABLE ab_vehicle ADD CONSTRAINT ab_vehicle_pk PRIMARY KEY ( vin );

ALTER TABLE ab_auto
    ADD CONSTRAINT ab_auto_ab_policy_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_policy ( policy_id );

ALTER TABLE ab_customer
    ADD CONSTRAINT ab_customer_ab_user_fk FOREIGN KEY ( user_id )
        REFERENCES ab_user ( user_id );

ALTER TABLE ab_driver_vehicle
    ADD CONSTRAINT ab_driver_vehicle_fk FOREIGN KEY ( vin )
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
    ADD CONSTRAINT ab_policy_ab_customer_fk FOREIGN KEY ( user_id )
        REFERENCES ab_customer ( user_id );

ALTER TABLE ab_user_role_mtom
    ADD CONSTRAINT ab_role_mtom_user_fk FOREIGN KEY ( user_id )
        REFERENCES ab_user ( user_id )
            ON DELETE CASCADE;

ALTER TABLE ab_user_role_mtom
    ADD CONSTRAINT ab_user_mtom_role_fk FOREIGN KEY ( role_id )
        REFERENCES ab_role ( role_id )
            ON DELETE CASCADE;

ALTER TABLE ab_vehicle
    ADD CONSTRAINT ab_vehicle_ab_auto_fk FOREIGN KEY ( policy_id )
        REFERENCES ab_auto ( policy_id );

ALTER TABLE ab_driver_vehicle
    ADD CONSTRAINT ab_vehicle_driver_fk FOREIGN KEY ( license )
        REFERENCES ab_driver ( license )
            ON DELETE CASCADE;


-- custom constraints

ALTER TABLE ab_invoice ALTER total_paid SET DEFAULT 0;

ALTER TABLE ab_customer
	ADD CONSTRAINT c_customer_gender
		CHECK (gender IN ('M', 'F', NULL));

ALTER TABLE ab_customer
	ADD CONSTRAINT c_customer_marry
		CHECK (marital_status IN ('M', 'S', 'W'));

ALTER TABLE ab_customer
	ADD CONSTRAINT c_customer_type
		CHECK (cust_type IN ('A', 'H', 'AH'));

ALTER TABLE ab_policy
	ADD CONSTRAINT c_policy_status
		CHECK (state IN ('C', 'P'));

ALTER TABLE ab_policy
	ADD CONSTRAINT c_policy_active
		CHECK (active IN (1, 0));

ALTER TABLE ab_house
	ADD CONSTRAINT c_home_house_type
		CHECK (house_type IN ('S', 'M', 'C', 'T'));

ALTER TABLE ab_house
	ADD CONSTRAINT c_home_fire_notif
		CHECK (auto_fire_notif IN (0, 1));

ALTER TABLE ab_house
	ADD CONSTRAINT c_home_sec_sys
		CHECK (home_security IN (0, 1));

ALTER TABLE ab_house
	ADD CONSTRAINT c_home_pool
		CHECK (pool IN ('U', 'O', 'I', 'M', NULL));

ALTER TABLE ab_house
	ADD CONSTRAINT c_home_basement
		CHECK (basement IN (0, 1));

ALTER TABLE ab_payment
	ADD CONSTRAINT c_payment_type
		CHECK (pay_type IN ('PayPal', 'Credit', 'Debit', 'Check'));

ALTER TABLE ab_vehicle
	ADD CONSTRAINT c_vehicle_status
		CHECK (state IN ('L', 'F', 'O'));

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
        a.p_type
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
        a.p_type
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
        a.p_type
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
        a.p_type
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
			SET MESSAGE_TEXT = 'DB Error: The Start date cannot be after the end date';
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
			SET MESSAGE_TEXT = 'DB Error: The Start date cannot be after the end date';
	END IF;
END
|

-- trigger to insure that AB_POLICY.PREMIUM is not negative

DROP TRIGGER IF EXISTS tr_policy_ins_prem |
CREATE TRIGGER tr_policy_ins_prem BEFORE
	INSERT ON ab_policy
    FOR EACH ROW
BEGIN
	IF (NEW.premium IS NULL OR NEW.premium < 0) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: Cannot create a policy with a negative premium';
	END IF;
END
 |

DROP TRIGGER IF EXISTS tr_policy_upd_prem |
CREATE TRIGGER tr_policy_upd_prem BEFORE
	UPDATE ON ab_policy
    FOR EACH ROW
BEGIN
	IF (NEW.premium IS NULL OR NEW.premium <= 0) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: Cannot create a policy with a negative premium';
	END IF;
END
 |

-- trigger to insure that AB_PAYMENT.AMOUNT is not negative

DROP TRIGGER IF EXISTS tr_pay_ins_amnt |
CREATE TRIGGER tr_pay_ins_amnt BEFORE
	INSERT ON ab_payment
    FOR EACH ROW
BEGIN
	IF (NEW.amount IS NULL OR NEW.amount <= 0) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'DB Error: Cannot create a payment that is 0 or negative';
	END IF;
END

|

-- Trigger to deduct a payment from the total owed on an invoice

DROP TRIGGER IF EXISTS tr_pay_ins_updtotal |
CREATE TRIGGER tr_pay_ins_updtotal BEFORE
	INSERT ON ab_payment
    FOR EACH ROW FOLLOWS tr_pay_ins_amnt
BEGIN
	UPDATE ab_invoice
    SET total_paid = total_paid + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END

|

-- Trigger to deactivate an invoice if it has been paid off fully

DROP TRIGGER IF EXISTS tr_invoice_upd_deactivate |
CREATE TRIGGER tr_invoice_upd_deactivate BEFORE INSERT ON ab_invoice
FOR EACH ROW
BEGIN
	DECLARE d DECIMAL(9,2);
    DECLARE a DECIMAL(7,2);
	SELECT
		a.total_paid, a.amount
	INTO d, a
	FROM
		ab_invoice a
	WHERE
		a.invoice_id = NEW.invoice_id;

	IF (NEW.active <> 0 and d IS NOT NULL AND d <> NEW.total_paid AND NEW.total_paid >= a) THEN
		SET NEW.active = 0;
	END IF;
END

|

DELIMITER ;



-- SQLINES DEMO *** per Data Modeler Summary Report:
--
-- SQLINES DEMO ***                        13
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                        27
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
