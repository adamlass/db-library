/*
 Navicat Premium Data Transfer

 Source Server         : dbclass
 Source Server Type    : PostgreSQL
 Source Server Version : 120000
 Source Host           : localhost:5433
 Source Catalog        : library
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120000
 File Encoding         : 65001

 Date: 27/02/2020 11:22:44
*/


-- ----------------------------
-- Sequence structure for Auther_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Auther_id_seq";
CREATE SEQUENCE "Auther_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Auther_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "Auther_id_seq1";
CREATE SEQUENCE "Auther_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for BookType_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "BookType_id_seq";
CREATE SEQUENCE "BookType_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Book_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Book_id_seq";
CREATE SEQUENCE "Book_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ClientType_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "ClientType_id_seq";
CREATE SEQUENCE "ClientType_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Client_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Client_id_seq";
CREATE SEQUENCE "Client_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Copy-Loan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Copy-Loan_id_seq";
CREATE SEQUENCE "Copy-Loan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Copy_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Copy_id_seq";
CREATE SEQUENCE "Copy_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Loan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Loan_id_seq";
CREATE SEQUENCE "Loan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Notification_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Notification_id_seq";
CREATE SEQUENCE "Notification_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Order_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Order_id_seq";
CREATE SEQUENCE "Order_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Author
-- ----------------------------
DROP TABLE IF EXISTS "Author";
CREATE TABLE "Author" (
  "id" int4 NOT NULL DEFAULT nextval('"Auther_id_seq"'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Author
-- ----------------------------
BEGIN;
INSERT INTO "Author" VALUES (1, 'JK Rowling');
INSERT INTO "Author" VALUES (2, 'RR Martin');
COMMIT;

-- ----------------------------
-- Table structure for Author-Book
-- ----------------------------
DROP TABLE IF EXISTS "Author-Book";
CREATE TABLE "Author-Book" (
  "author_id" int4 NOT NULL,
  "book_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Author-Book
-- ----------------------------
BEGIN;
INSERT INTO "Author-Book" VALUES (1, 1);
INSERT INTO "Author-Book" VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for Book
-- ----------------------------
DROP TABLE IF EXISTS "Book";
CREATE TABLE "Book" (
  "id" int4 NOT NULL DEFAULT nextval('"Book_id_seq"'::regclass),
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "yearOfPublication" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Book
-- ----------------------------
BEGIN;
INSERT INTO "Book" VALUES (1, 'Harry Potter 1', 2001);
INSERT INTO "Book" VALUES (2, 'GOT 1', 2009);
COMMIT;

-- ----------------------------
-- Table structure for BookEdition
-- ----------------------------
DROP TABLE IF EXISTS "BookEdition";
CREATE TABLE "BookEdition" (
  "ISBN" int4 NOT NULL,
  "isRare" bool NOT NULL DEFAULT false,
  "allowedLoanPeriod" int4 NOT NULL DEFAULT 14,
  "publisher_id" int4 NOT NULL,
  "book_id" int4 NOT NULL,
  "book_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of BookEdition
-- ----------------------------
BEGIN;
INSERT INTO "BookEdition" VALUES (23, 't', 7, 1, 1, 1);
INSERT INTO "BookEdition" VALUES (23421, 'f', 50, 1, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for BookType
-- ----------------------------
DROP TABLE IF EXISTS "BookType";
CREATE TABLE "BookType" (
  "id" int4 NOT NULL DEFAULT nextval('"BookType_id_seq"'::regclass),
  "type" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of BookType
-- ----------------------------
BEGIN;
INSERT INTO "BookType" VALUES (1, 'Hardcover');
INSERT INTO "BookType" VALUES (2, 'eBook');
INSERT INTO "BookType" VALUES (3, 'Audio');
COMMIT;

-- ----------------------------
-- Table structure for Client
-- ----------------------------
DROP TABLE IF EXISTS "Client";
CREATE TABLE "Client" (
  "id" int4 NOT NULL DEFAULT nextval('"Client_id_seq"'::regclass),
  "client_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Client
-- ----------------------------
BEGIN;
INSERT INTO "Client" VALUES (1, 1);
INSERT INTO "Client" VALUES (2, 2);
INSERT INTO "Client" VALUES (3, 3);
COMMIT;

-- ----------------------------
-- Table structure for ClientType
-- ----------------------------
DROP TABLE IF EXISTS "ClientType";
CREATE TABLE "ClientType" (
  "id" int4 NOT NULL DEFAULT nextval('"ClientType_id_seq"'::regclass),
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantityAllowed" int4 NOT NULL
)
;

-- ----------------------------
-- Records of ClientType
-- ----------------------------
BEGIN;
INSERT INTO "ClientType" VALUES (1, 'Student', 3);
INSERT INTO "ClientType" VALUES (2, 'Teacher', 2);
INSERT INTO "ClientType" VALUES (3, 'Other', 1);
COMMIT;

-- ----------------------------
-- Table structure for Copy
-- ----------------------------
DROP TABLE IF EXISTS "Copy";
CREATE TABLE "Copy" (
  "id" int4 NOT NULL DEFAULT nextval('"Copy_id_seq"'::regclass),
  "book_edition_ISBN" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Copy
-- ----------------------------
BEGIN;
INSERT INTO "Copy" VALUES (1, 23421);
INSERT INTO "Copy" VALUES (3, 23);
INSERT INTO "Copy" VALUES (4, 23421);
INSERT INTO "Copy" VALUES (5, 23421);
INSERT INTO "Copy" VALUES (6, 23421);
INSERT INTO "Copy" VALUES (7, 23421);
INSERT INTO "Copy" VALUES (8, 23421);
INSERT INTO "Copy" VALUES (9, 23421);
INSERT INTO "Copy" VALUES (2, 23);
INSERT INTO "Copy" VALUES (10, 23);
INSERT INTO "Copy" VALUES (11, 23);
INSERT INTO "Copy" VALUES (12, 23);
INSERT INTO "Copy" VALUES (13, 23);
INSERT INTO "Copy" VALUES (14, 23);
INSERT INTO "Copy" VALUES (15, 23);
COMMIT;

-- ----------------------------
-- Table structure for Copy-Loan
-- ----------------------------
DROP TABLE IF EXISTS "Copy-Loan";
CREATE TABLE "Copy-Loan" (
  "copy_id" int4 NOT NULL,
  "loan_id" int4 NOT NULL,
  "returned" timestamptz(6),
  "id" int4 NOT NULL DEFAULT nextval('"Copy-Loan_id_seq"'::regclass)
)
;

-- ----------------------------
-- Records of Copy-Loan
-- ----------------------------
BEGIN;
INSERT INTO "Copy-Loan" VALUES (4, 6, NULL, 7);
INSERT INTO "Copy-Loan" VALUES (4, 5, NULL, 6);
INSERT INTO "Copy-Loan" VALUES (11, 8, NULL, 10);
INSERT INTO "Copy-Loan" VALUES (12, 8, NULL, 11);
INSERT INTO "Copy-Loan" VALUES (2, 4, NULL, 8);
INSERT INTO "Copy-Loan" VALUES (2, 6, NULL, 4);
INSERT INTO "Copy-Loan" VALUES (4, 6, NULL, 5);
INSERT INTO "Copy-Loan" VALUES (4, 8, NULL, 9);
INSERT INTO "Copy-Loan" VALUES (3, 4, NULL, 12);
INSERT INTO "Copy-Loan" VALUES (1, 4, '2020-02-27 10:51:53.021663+01', 1);
COMMIT;

-- ----------------------------
-- Table structure for Loan
-- ----------------------------
DROP TABLE IF EXISTS "Loan";
CREATE TABLE "Loan" (
  "id" int4 NOT NULL DEFAULT nextval('"Loan_id_seq"'::regclass),
  "loaned" timestamptz(6) NOT NULL,
  "client_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Loan
-- ----------------------------
BEGIN;
INSERT INTO "Loan" VALUES (4, '2020-02-24 15:39:39+01', 1);
INSERT INTO "Loan" VALUES (5, '2020-02-21 15:39:52+01', 2);
INSERT INTO "Loan" VALUES (6, '2017-11-07 15:20:07+01', 1);
INSERT INTO "Loan" VALUES (8, '2020-02-27 08:34:44+01', 1);
COMMIT;

-- ----------------------------
-- Table structure for Notification
-- ----------------------------
DROP TABLE IF EXISTS "Notification";
CREATE TABLE "Notification" (
  "id" int4 NOT NULL DEFAULT nextval('"Notification_id_seq"'::regclass),
  "client_id" int4 NOT NULL,
  "copy_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Notification
-- ----------------------------
BEGIN;
INSERT INTO "Notification" VALUES (1, 1, 7);
INSERT INTO "Notification" VALUES (2, 1, 7);
INSERT INTO "Notification" VALUES (3, 1, 7);
INSERT INTO "Notification" VALUES (4, 1, 7);
INSERT INTO "Notification" VALUES (5, 1, 4);
INSERT INTO "Notification" VALUES (6, 1, 4);
INSERT INTO "Notification" VALUES (7, 1, 4);
INSERT INTO "Notification" VALUES (8, 1, 4);
INSERT INTO "Notification" VALUES (9, 1, 2);
INSERT INTO "Notification" VALUES (10, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for Order
-- ----------------------------
DROP TABLE IF EXISTS "Order";
CREATE TABLE "Order" (
  "date" timestamptz(6) NOT NULL,
  "book_edition_ISBN" int4 NOT NULL,
  "copy_loan_id" int4,
  "reserved_copy_id" int4,
  "client_id" int4 NOT NULL,
  "id" int4 NOT NULL DEFAULT nextval('"Order_id_seq"'::regclass)
)
;

-- ----------------------------
-- Records of Order
-- ----------------------------
BEGIN;
INSERT INTO "Order" VALUES ('2020-02-24 15:30:23+01', 23, 1, NULL, 1, 2);
INSERT INTO "Order" VALUES ('2020-02-26 13:24:32+01', 23421, NULL, NULL, 2, 6);
INSERT INTO "Order" VALUES ('2020-02-25 13:25:47+01', 23421, NULL, 1, 3, 10);
INSERT INTO "Order" VALUES ('2020-02-24 15:31:43+01', 23, NULL, 3, 2, 3);
INSERT INTO "Order" VALUES ('2020-02-26 13:24:03+01', 23421, NULL, 1, 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for Publisher
-- ----------------------------
DROP TABLE IF EXISTS "Publisher";
CREATE TABLE "Publisher" (
  "id" int4 NOT NULL DEFAULT nextval('"Auther_id_seq1"'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Publisher
-- ----------------------------
BEGIN;
INSERT INTO "Publisher" VALUES (1, 'Gyldendal');
COMMIT;

-- ----------------------------
-- Function structure for book_available
-- ----------------------------
DROP FUNCTION IF EXISTS "book_available"("copytobereturned" int4);
CREATE OR REPLACE FUNCTION "book_available"("copytobereturned" int4)
  RETURNS "pg_catalog"."bool" AS $BODY$
	declare
	var_is_available bool;
	var_copyid int;
	var_is_loaned int;
	var_is_on_order int;
	
	begin

		SELECT "id" 
		INTO var_copyid
		FROM "Copy" c
		WHERE c.id = copyToBeReturned;
		
	
	IF var_copyid IS NOT NULL then
		RAISE NOTICE 'BOOK EXISTS ID: %', var_copyid;
		
		SELECT "id" 
		INTO var_is_loaned
		FROM "Copy-Loan" c
		WHERE c.copy_id = var_copyid and c.returned is NULL;
		
		if var_is_loaned is null then
			raise notice'Book is not loaned out to anyone';
			SELECT "id" 
			INTO var_is_on_order
			FROM "Order" o
			WHERE o.copy_loan_id = var_copyid;
		
			IF var_is_on_order IS NULL then
				raise notice'Book isnt ordered, it is available!';
				var_is_available = true;
				return var_is_available;
			else
				raise notice'Book is ordered but not picked up yet, sorry';
				var_is_available = false;
				return var_is_available;
			end if;
		
		else
			raise notice'Someone has already loaned this copy sorry';
			var_is_available = false;
			return var_is_available;
		end if;
	
	else
		raise notice 'book with that id does not exist';
		var_is_available = false;
		return var_is_available;
	end if;	
		
	
	
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loan_error_trigger
-- ----------------------------
DROP FUNCTION IF EXISTS "loan_error_trigger"();
CREATE OR REPLACE FUNCTION "loan_error_trigger"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	declare
	var_id int = new.copy_id;
	
	var_is_book_available boolean := book_available(new.copy_id);
	
	begin
		
	if var_is_book_available is true then
		raise notice'Book was succesfully inserted %', new.copy_id;
	else
		raise exception'BOOK ALREADY EXISTS MAYN';
	end if;
	
	RETURN NEW;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for most_popular_book
-- ----------------------------
DROP FUNCTION IF EXISTS "most_popular_book"("clienttype" text, "startdate" date, "enddate" date);
CREATE OR REPLACE FUNCTION "most_popular_book"("clienttype" text, "startdate" date, "enddate" date)
  RETURNS TABLE("title" text, "amount" int8) AS $BODY$
	BEGIN
		return query select b.title, count(b.title)
			from public."Copy-Loan" cl 
			inner join public."Copy" c on cl.copy_id  = c.id
			inner join public."BookEdition" be on c."book_edition_ISBN" = be."ISBN" 
			inner join public."Book" b on be.book_id = b.id 
			inner join public."Loan" l on cl.loan_id = l.id 
			inner join public."Client" cli on l.client_id = cli.id 
			inner join public."ClientType" ct on cli.client_type_id = ct.id 
			where ct."type"  = clientType and l.loaned > startDate and l.loaned < endDate
			group by b.title 
			order by count(b.title) desc 
			limit 1;
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for notification
-- ----------------------------
DROP FUNCTION IF EXISTS "notification"();
CREATE OR REPLACE FUNCTION "notification"()
  RETURNS "pg_catalog"."void" AS $BODY$
	DECLARE
		r "Copy-Loan"%rowtype;
		var_isbn int;
		var_alp int;
		var_loaned timestamptz;
		var_age int;
		var_client_id int;
	BEGIN
		FOR r IN
        SELECT *
				FROM "Copy-Loan" 
				WHERE returned IS NULL
    LOOP
				RAISE NOTICE '------Doing Copy-Loan %', r.id;
        SELECT "book_edition_ISBN"
				INTO var_isbn
				FROM "Copy"
				WHERE id = r."copy_id";
				RAISE NOTICE 'isbn %', var_isbn;
				
				SELECT "allowedLoanPeriod"
				INTO var_alp
				FROM "BookEdition"
				WHERE "ISBN" = var_isbn;
				RAISE NOTICE 'allowedLoanPeriod %', var_alp;
				
				SELECT "loaned", "client_id"
				INTO var_loaned, var_client_id
				FROM "Loan"
				WHERE id = r."loan_id";
				RAISE NOTICE 'date of loan %', var_loaned;
				

				var_age = (SELECT EXTRACT(DAY FROM NOW() - var_loaned));
				RAISE NOTICE 'Age: %', var_age;
				
				IF var_age >= var_alp THEN
					RAISE NOTICE 'is overdue!';
					
					
					INSERT INTO "Notification" 
					("client_id", "copy_id") 
					VALUES 
					(var_client_id, r."copy_id");
					RAISE NOTICE 'Notification was written!';
				END IF;
				
				
    END LOOP;
		
		
	
  
	END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for return_copy
-- ----------------------------
DROP FUNCTION IF EXISTS "return_copy"("copytobereturned" int4);
CREATE OR REPLACE FUNCTION "return_copy"("copytobereturned" int4)
  RETURNS "pg_catalog"."void" AS $BODY$
	DECLARE
	var_returned bool;
	var_isbn int;
	var_order int;
	BEGIN
  -- Routine body goes here...	
	UPDATE "Copy-Loan" 
	INTO var_returned
	SET returned = CURRENT_TIMESTAMP 
	WHERE copy_id = copyToBeReturned 
		AND returned IS NULL
	RETURNING true;
	
	IF var_returned THEN
		RAISE NOTICE 'Copy was returned!';

		SELECT "book_edition_ISBN" 
		INTO var_isbn
		FROM "Copy" c
		WHERE c.id = copyToBeReturned;
		RAISE NOTICE 'ISBN FOUND %',var_isbn;
		
		SELECT "id"
		INTO var_order
		FROM "Order" o
		WHERE o."book_edition_ISBN" = var_isbn 
			AND o."reserved_copy_id" IS NULL 
			AND o."copy_loan_id" IS NULL
		ORDER BY o.date ASC
		LIMIT 1;

		RAISE NOTICE 'Order found for reservation %',var_order;
		
		IF var_order IS NOT NULL THEN
			UPDATE "Order"
			SET "reserved_copy_id" = copyToBeReturned
			WHERE id = var_order;
			RAISE NOTICE 'Updated reserved_copy_id on order to %',copyToBeReturned;
		END IF;
	ELSE
		RAISE NOTICE 'Copy was aldready returned!';
	END IF;
	
	
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "Auther_id_seq"
OWNED BY "Author"."id";
SELECT setval('"Auther_id_seq"', 3, true);
ALTER SEQUENCE "Auther_id_seq1"
OWNED BY "Publisher"."id";
SELECT setval('"Auther_id_seq1"', 2, true);
ALTER SEQUENCE "BookType_id_seq"
OWNED BY "BookType"."id";
SELECT setval('"BookType_id_seq"', 4, true);
ALTER SEQUENCE "Book_id_seq"
OWNED BY "Book"."id";
SELECT setval('"Book_id_seq"', 3, true);
ALTER SEQUENCE "ClientType_id_seq"
OWNED BY "ClientType"."id";
SELECT setval('"ClientType_id_seq"', 4, true);
ALTER SEQUENCE "Client_id_seq"
OWNED BY "Client"."id";
SELECT setval('"Client_id_seq"', 4, true);
ALTER SEQUENCE "Copy-Loan_id_seq"
OWNED BY "Copy-Loan"."id";
SELECT setval('"Copy-Loan_id_seq"', 25, true);
ALTER SEQUENCE "Copy_id_seq"
OWNED BY "Copy"."id";
SELECT setval('"Copy_id_seq"', 16, true);
ALTER SEQUENCE "Loan_id_seq"
OWNED BY "Loan"."id";
SELECT setval('"Loan_id_seq"', 9, true);
ALTER SEQUENCE "Notification_id_seq"
OWNED BY "Notification"."id";
SELECT setval('"Notification_id_seq"', 11, true);
ALTER SEQUENCE "Order_id_seq"
OWNED BY "Order"."id";
SELECT setval('"Order_id_seq"', 11, true);

-- ----------------------------
-- Primary Key structure for table Author
-- ----------------------------
ALTER TABLE "Author" ADD CONSTRAINT "Auther_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Author-Book
-- ----------------------------
ALTER TABLE "Author-Book" ADD CONSTRAINT "Author-Book_pkey" PRIMARY KEY ("author_id", "book_id");

-- ----------------------------
-- Primary Key structure for table Book
-- ----------------------------
ALTER TABLE "Book" ADD CONSTRAINT "Book_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table BookEdition
-- ----------------------------
ALTER TABLE "BookEdition" ADD CONSTRAINT "BookVersion_pkey" PRIMARY KEY ("ISBN");

-- ----------------------------
-- Uniques structure for table BookType
-- ----------------------------
ALTER TABLE "BookType" ADD CONSTRAINT "unique_type" UNIQUE ("type");

-- ----------------------------
-- Primary Key structure for table BookType
-- ----------------------------
ALTER TABLE "BookType" ADD CONSTRAINT "BookType_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Client
-- ----------------------------
ALTER TABLE "Client" ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ClientType
-- ----------------------------
ALTER TABLE "ClientType" ADD CONSTRAINT "unique_client_type_type" UNIQUE ("type");

-- ----------------------------
-- Primary Key structure for table ClientType
-- ----------------------------
ALTER TABLE "ClientType" ADD CONSTRAINT "ClientType_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Copy
-- ----------------------------
ALTER TABLE "Copy" ADD CONSTRAINT "Copy_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table Copy-Loan
-- ----------------------------
CREATE TRIGGER "insert_loan_trigger" BEFORE INSERT ON "Copy-Loan"
FOR EACH ROW
EXECUTE PROCEDURE "public"."loan_error_trigger"();

-- ----------------------------
-- Primary Key structure for table Copy-Loan
-- ----------------------------
ALTER TABLE "Copy-Loan" ADD CONSTRAINT "CopyLoan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Loan
-- ----------------------------
ALTER TABLE "Loan" ADD CONSTRAINT "Loan_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Notification
-- ----------------------------
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Order
-- ----------------------------
ALTER TABLE "Order" ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Publisher
-- ----------------------------
ALTER TABLE "Publisher" ADD CONSTRAINT "Auther_pkey1" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table Author-Book
-- ----------------------------
ALTER TABLE "Author-Book" ADD CONSTRAINT "author_book_id_fk" FOREIGN KEY ("book_id") REFERENCES "Book" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Author-Book" ADD CONSTRAINT "book_author_id_fk" FOREIGN KEY ("author_id") REFERENCES "Author" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table BookEdition
-- ----------------------------
ALTER TABLE "BookEdition" ADD CONSTRAINT "book_edition_book_id_fk" FOREIGN KEY ("book_id") REFERENCES "Book" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "BookEdition" ADD CONSTRAINT "book_edition_booktype_id-fk" FOREIGN KEY ("book_type_id") REFERENCES "BookType" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "BookEdition" ADD CONSTRAINT "book_edition_publisher_id_fk" FOREIGN KEY ("publisher_id") REFERENCES "Publisher" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Client
-- ----------------------------
ALTER TABLE "Client" ADD CONSTRAINT "client_client_type_id" FOREIGN KEY ("client_type_id") REFERENCES "ClientType" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Copy
-- ----------------------------
ALTER TABLE "Copy" ADD CONSTRAINT "copy_book_edition_ISBN_fk" FOREIGN KEY ("book_edition_ISBN") REFERENCES "BookEdition" ("ISBN") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Copy-Loan
-- ----------------------------
ALTER TABLE "Copy-Loan" ADD CONSTRAINT "copyloan_copy_id_fk" FOREIGN KEY ("copy_id") REFERENCES "Copy" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Copy-Loan" ADD CONSTRAINT "copyloan_loan_id_fk" FOREIGN KEY ("loan_id") REFERENCES "Loan" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Loan
-- ----------------------------
ALTER TABLE "Loan" ADD CONSTRAINT "load_client_id_fk" FOREIGN KEY ("client_id") REFERENCES "Client" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Notification
-- ----------------------------
ALTER TABLE "Notification" ADD CONSTRAINT "notification_client_id_fk" FOREIGN KEY ("client_id") REFERENCES "Client" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Notification" ADD CONSTRAINT "notification_copy_id_fk" FOREIGN KEY ("copy_id") REFERENCES "Copy" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Order
-- ----------------------------
ALTER TABLE "Order" ADD CONSTRAINT "order_book_edition_ISBN_fk" FOREIGN KEY ("book_edition_ISBN") REFERENCES "BookEdition" ("ISBN") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Order" ADD CONSTRAINT "order_client_id_fk" FOREIGN KEY ("client_id") REFERENCES "Client" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Order" ADD CONSTRAINT "order_copy_loan_id_fk" FOREIGN KEY ("copy_loan_id") REFERENCES "Copy-Loan" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Order" ADD CONSTRAINT "order_reserved_copy_id_fk" FOREIGN KEY ("reserved_copy_id") REFERENCES "Copy" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
