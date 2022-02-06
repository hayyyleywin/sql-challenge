-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/X5zOgk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "DEPARTMENTS" (
    "Dept_no" VARCHAR   NOT NULL,
    "Dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "DEPT_EMP" (
    "employee_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPT_EMP" PRIMARY KEY (
        "employee_no","dept_no"
     )
);

CREATE TABLE "DEPT_MANAGER" (
    "dept_no" VARCHAR   NOT NULL,
    "employee_no" INT   NOT NULL,
    CONSTRAINT "pk_DEPT_MANAGER" PRIMARY KEY (
        "dept_no","employee_no"
     )
);

CREATE TABLE "EMPLOYEE" (
    "employee_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEE" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "SALARIES" (
    "employee_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_SALARIES" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "TITLES" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "fk_DEPARTMENTS_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "DEPT_EMP" ("dept_no");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("Dept_no");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_employee_no" FOREIGN KEY("employee_no")
REFERENCES "EMPLOYEE" ("employee_no");

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "fk_EMPLOYEE_employee_no" FOREIGN KEY("employee_no")
REFERENCES "DEPT_EMP" ("employee_no");

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "fk_EMPLOYEE_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "TITLES" ("title_id");

