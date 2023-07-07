-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/HykK8h
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--File can be run top to bottom as a whole until the "SELECT *" statements at the end
--Right-click and highlight all until the point indicated in the comment line above
--Run the "SELECT *" statements individually to verify data

--Table Creation
CREATE TABLE "Category" (
    "category_id" VARCHAR(8)   NOT NULL,
    "category" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" VARCHAR(8)   NOT NULL,
    "subcategory" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(70)   NOT NULL,
    "description" VARCHAR(70)   NOT NULL,
    "goal" NUMERIC(10,2)   NOT NULL,
    "pledged" NUMERIC(10,2)   NOT NULL,
    "outcome" VARCHAR(20)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(8)   NOT NULL,
    "currency" VARCHAR(8)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(8)   NOT NULL,
    "subcategory_id" VARCHAR(8)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "Last_name" VARCHAR(20)   NOT NULL,
    "email" VARCHAR(70)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);


-- Table Alterations for Foreign Key Relationships
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategory" ("subcategory_id");


--Verify Table Creation & Data Upload For all 4 Tables
SELECT * FROM "Campaign";

SELECT * FROM "Category";

SELECT * FROM "Subcategory";

SELECT * FROM "Contacts";
