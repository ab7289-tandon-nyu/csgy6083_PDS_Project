-- Generated by Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   at:        2021-07-26 17:34:54 EDT
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ab_auto (
    policy_id NUMBER NOT NULL
);

COMMENT ON COLUMN ab_auto.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID';

ALTER TABLE ab_auto ADD CONSTRAINT ab_auto_pk PRIMARY KEY ( policy_id );

CREATE TABLE ab_customer (
    cust_id         NUMBER(7) NOT NULL,
    fname           VARCHAR2(32) NOT NULL,
    mname           VARCHAR2(1),
    lname           VARCHAR2(32) NOT NULL,
    gender          VARCHAR2(1),
    marital_status  VARCHAR2(1) NOT NULL,
    cust_type       VARCHAR2(1) NOT NULL,
    street_1        VARCHAR2(32) NOT NULL,
    street_2        VARCHAR2(32),
    city            VARCHAR2(32) NOT NULL,
    state           VARCHAR2(2) NOT NULL,
    zip             VARCHAR2(5) NOT NULL
);

COMMENT ON COLUMN ab_customer.cust_id IS
    'THE CUSTOMERS UNIQUE ID';

COMMENT ON COLUMN ab_customer.fname IS
    'THE CUSTOMERS FIRST NAME';

COMMENT ON COLUMN ab_customer.mname IS
    'THE CUSTOMERS MIDDLE INITIAL';

COMMENT ON COLUMN ab_customer.lname IS
    'THE CUSTOMERS LAST NAME';

COMMENT ON COLUMN ab_customer.gender IS
    'THE CUSTOMERS GENDER';

COMMENT ON COLUMN ab_customer.marital_status IS
    'THE CUSTOMERS MARITAL STATUS. EITHER ''M'', ''S'', OR ''W''';

COMMENT ON COLUMN ab_customer.cust_type IS
    'THE CUSTOMER TYPE. ''A'' AUTOMOBILE INSURANCE, ''H'' HOME INSURANCE.';

COMMENT ON COLUMN ab_customer.street_1 IS
    'CUSTOMERS STREET ADDRESS';

COMMENT ON COLUMN ab_customer.street_2 IS
    'OPTIONAL CUSTOMER FLOOR/APARTMENT.';

COMMENT ON COLUMN ab_customer.city IS
    'THE CUSTOMERS ADDRESS CITY.';

COMMENT ON COLUMN ab_customer.state IS
    'THE CUSTOMERS HOME ADDRESS STATE CODE';

COMMENT ON COLUMN ab_customer.zip IS
    'THE CUSTOMERS HOME ADDRESS ZIPCODE.';

ALTER TABLE ab_customer ADD CONSTRAINT ab_customer_pk PRIMARY KEY ( cust_id );

CREATE TABLE ab_driver (
    license    VARCHAR2(16) NOT NULL,
    fname      VARCHAR2(32) NOT NULL,
    mname      VARCHAR2(1),
    lname      VARCHAR2(32) NOT NULL,
    birthdate  DATE NOT NULL
);

COMMENT ON COLUMN ab_driver.license IS
    'THE DRIVERS LICENSE NUMBER';

COMMENT ON COLUMN ab_driver.fname IS
    'THE DRIVERS FIRST NAME.';

COMMENT ON COLUMN ab_driver.mname IS
    'THE DRIVERS OPTIONAL MIDDLE INITIAL.';

COMMENT ON COLUMN ab_driver.lname IS
    'THE DRIVERS LAST NAME.';

COMMENT ON COLUMN ab_driver.birthdate IS
    'THE DRIVERS BIRTHDATE.';

ALTER TABLE ab_driver ADD CONSTRAINT ab_driver_pk PRIMARY KEY ( license );

CREATE TABLE ab_driver_vehicle (
    license  VARCHAR2(16) NOT NULL,
    vin      VARCHAR2(17) NOT NULL
);

COMMENT ON COLUMN ab_driver_vehicle.license IS
    'THE LICENSE OF THE CARS DRIVER';

COMMENT ON COLUMN ab_driver_vehicle.vin IS
    'THE VIN OF THE INSURED VEHICLE';

ALTER TABLE ab_driver_vehicle ADD CONSTRAINT ab_driver_vehicle_pk PRIMARY KEY ( license,
                                                                                vin );

CREATE TABLE ab_home (
    policy_id NUMBER NOT NULL
);

COMMENT ON COLUMN ab_home.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID';

ALTER TABLE ab_home ADD CONSTRAINT ab_home_pk PRIMARY KEY ( policy_id );

CREATE TABLE ab_house (
    home_id          NUMBER(7) NOT NULL,
    purchase_date    DATE NOT NULL,
    purchase_value   NUMBER(9, 2) NOT NULL,
    area             NUMBER(7, 2) NOT NULL,
    type             VARCHAR2(1) NOT NULL,
    auto_fire_notif  NUMBER NOT NULL,
    home_security    NUMBER NOT NULL,
    pool             VARCHAR2(1),
    basement         NUMBER NOT NULL,
    policy_id        NUMBER NOT NULL
);

COMMENT ON COLUMN ab_house.home_id IS
    'THE UNIQUE HOME ID';

COMMENT ON COLUMN ab_house.purchase_date IS
    'THE DATE THE HOME WAS PURCHASED.';

COMMENT ON COLUMN ab_house.purchase_value IS
    'THE HOMES PURCHASE VALUE.';

COMMENT ON COLUMN ab_house.area IS
    'THE HOMES AREA IN SQUARE FEET.';

COMMENT ON COLUMN ab_house.type IS
    'THE HOME TYPE. ''S'' IS SINGLE FAMILY, ''M'' IS MULTI FAMILY, ''C'' IS CONDOMINIUM, ''T'' IS TOWN HOUSE.';

COMMENT ON COLUMN ab_house.auto_fire_notif IS
    'WHETHER THE HOUSE HAS AUTOMATIC FIRE NOTIFICATION TO THE FIRE DEPARTMENT.';

COMMENT ON COLUMN ab_house.home_security IS
    'WHETHER THE HOUSE HAS A SECURITY SYSTEM.';

COMMENT ON COLUMN ab_house.pool IS
    'SWIMMING POOL. ''U'' IS UNDERGROUND, ''O'' IS OVERGROUND, ''I'' IS INDOOR, ''M'' IS MULTIPLE, NULL IS NO POOL.';

COMMENT ON COLUMN ab_house.basement IS
    'WHETHER THE HOUSE HAS A BASEMENT.';

COMMENT ON COLUMN ab_house.policy_id IS
    'THE ID OF THE POLICY INSURING THE HOUSE';

ALTER TABLE ab_house ADD CONSTRAINT ab_house_pk PRIMARY KEY ( home_id );

CREATE TABLE ab_invoice (
    invoice_id    NUMBER(7) NOT NULL,
    invoice_date  DATE NOT NULL,
    amount        NUMBER(7, 2) NOT NULL,
    payment_date  DATE NOT NULL,
    total_paid    NUMBER(9, 2) NOT NULL,
    active        NUMBER NOT NULL,
    policy_id     NUMBER NOT NULL
);

COMMENT ON COLUMN ab_invoice.invoice_id IS
    'THE INVOICE ID';

COMMENT ON COLUMN ab_invoice.invoice_date IS
    'THE DATE GENERATED.';

COMMENT ON COLUMN ab_invoice.amount IS
    'THE AMOUNT DUE';

COMMENT ON COLUMN ab_invoice.payment_date IS
    'THE DATE THE INVOICE IS DUE.';

COMMENT ON COLUMN ab_invoice.total_paid IS
    'The amount that the client has paid so far.';

COMMENT ON COLUMN ab_invoice.active IS
    'WHETHER THE INVOICE IS ACTIVE';

COMMENT ON COLUMN ab_invoice.policy_id IS
    'ID OF THE POLICY THAT THE INVOICE BELONGS TO';

ALTER TABLE ab_invoice ADD CONSTRAINT ab_invoice_pk PRIMARY KEY ( invoice_id );

CREATE TABLE ab_payment (
    p_id        NUMBER(9) NOT NULL,
    pay_date    DATE NOT NULL,
    amount      NUMBER(7, 2) NOT NULL,
    type        VARCHAR2(6) NOT NULL,
    invoice_id  NUMBER NOT NULL
);

COMMENT ON COLUMN ab_payment.p_id IS
    'THE PAYMENT ID';

COMMENT ON COLUMN ab_payment.pay_date IS
    'THE DATE THE PAYMENT WAS MADE';

COMMENT ON COLUMN ab_payment.amount IS
    'THE PAYMENT INSTALLMENT AMOUNT.';

COMMENT ON COLUMN ab_payment.type IS
    'THE METHOD OF PAYMENT; ONE OF ''PayPal'', ''Credit'', ''Debit'', OR ''Check''.';

COMMENT ON COLUMN ab_payment.invoice_id IS
    'THE INVOICE THE PAYMENT IS GOING TOWARDS';

ALTER TABLE ab_payment ADD CONSTRAINT ab_payment_pk PRIMARY KEY ( p_id );

CREATE TABLE ab_policy (
    policy_id   NUMBER(7) NOT NULL,
    type        VARCHAR2(9) NOT NULL,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    premium     NUMBER(7, 2) NOT NULL,
    status      VARCHAR2(1) NOT NULL,
    active      NUMBER NOT NULL,
    cust_id     NUMBER(7) NOT NULL
);

ALTER TABLE ab_policy
    ADD CONSTRAINT ch_inh_ab_policy CHECK ( type IN ( 'A', 'AB_POLICY', 'H' ) );

COMMENT ON COLUMN ab_policy.policy_id IS
    'THE INSURANCE POLICY UNIQUE ID';

COMMENT ON COLUMN ab_policy.type IS
    'THE POLICY TYPE. ''A'' FOR AUTO AND ''H'' FOR HOME.';

COMMENT ON COLUMN ab_policy.start_date IS
    'THE POLICY START DATE';

COMMENT ON COLUMN ab_policy.end_date IS
    'THE POLICY END DATE.';

COMMENT ON COLUMN ab_policy.premium IS
    'THE PREMIUM AMOUNT.';

COMMENT ON COLUMN ab_policy.status IS
    'THE POLICY STATUS. ''C'' FOR CURRENT, ''P'' FOR EXPIRED.';

COMMENT ON COLUMN ab_policy.active IS
    'WHETHER THE POLICY IS STILL ACTIVE';

COMMENT ON COLUMN ab_policy.cust_id IS
    'ID OF THE CUSTOMER HOLDING THE POLICY';

ALTER TABLE ab_policy ADD CONSTRAINT ab_policy_pk PRIMARY KEY ( policy_id );

CREATE TABLE ab_vehicle (
    vin        VARCHAR2(17) NOT NULL,
    make       VARCHAR2(32) NOT NULL,
    model      VARCHAR2(32) NOT NULL,
    year       NUMBER(4) NOT NULL,
    status     VARCHAR2(1) NOT NULL,
    policy_id  NUMBER NOT NULL
);

COMMENT ON COLUMN ab_vehicle.vin IS
    'THE VEHICLE IDENTIFICATION NUMBER';

COMMENT ON COLUMN ab_vehicle.make IS
    'THE VEHICLE MAKE.';

COMMENT ON COLUMN ab_vehicle.model IS
    'THE VEHICLE MODEL.';

COMMENT ON COLUMN ab_vehicle.year IS
    'THE VEHICLE YEAR.';

COMMENT ON COLUMN ab_vehicle.status IS
    'VEHICLE STATUS. ''L'' IS LEASED, ''F'' IS FINANCED, AND ''O'' IS OWNED.';

COMMENT ON COLUMN ab_vehicle.policy_id IS
    'THE ID OF THE POLICY INSURING THE CAR';

ALTER TABLE ab_vehicle ADD CONSTRAINT ab_vehicle_pk PRIMARY KEY ( vin );

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

CREATE OR REPLACE TRIGGER arc_fkarc_2_ab_home BEFORE
    INSERT OR UPDATE OF policy_id ON ab_home
    FOR EACH ROW
DECLARE
    d VARCHAR2(9);
BEGIN
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = :new.policy_id;

    IF ( d IS NULL OR d <> 'H' ) THEN
        raise_application_error(-20223,
                               'FK AB_HOME_AB_POLICY_FK in Table AB_HOME violates Arc constraint on Table AB_POLICY - discriminator column TYPE doesn''t have value ''H''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_2_ab_auto BEFORE
    INSERT OR UPDATE OF policy_id ON ab_auto
    FOR EACH ROW
DECLARE
    d VARCHAR2(9);
BEGIN
    SELECT
        a.type
    INTO d
    FROM
        ab_policy a
    WHERE
        a.policy_id = :new.policy_id;

    IF ( d IS NULL OR d <> 'A' ) THEN
        raise_application_error(-20223,
                               'FK AB_AUTO_AB_POLICY_FK in Table AB_AUTO violates Arc constraint on Table AB_POLICY - discriminator column TYPE doesn''t have value ''A''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
