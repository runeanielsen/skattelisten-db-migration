-- migrate:up
create table company_type (
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   type varchar(255) NOT NULL
);

create table company (
  se INT,
  cvr INT,
  name varchar(255) NOT NULL,
  company_type_id INT REFERENCES company_type (id) NOT NULL,
  PRIMARY KEY(se, cvr)
);

create table tax_record (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  taxable_income FLOAT NOT NULL,
  year INT NOT NULL,
  deficit FLOAT NOT NULL,
  corporate_tax FLOAT NOT NULL,
  company_cvr INT NOT NULL,
  company_se INT NOT NULL,
  FOREIGN KEY (company_cvr, company_se) REFERENCES company (cvr, se)
);

-- migrate:down
DROP TABLE company_type CASCADE;
DROP TABLE company CASCADE;
DROP TABLE tax_record CASCADE;
