-- migrate:up
CREATE TYPE company_type AS ENUM ('individual_company', 'subsidiary', 'management_company');

CREATE TABLE company (
  PRIMARY KEY(se, cvr),
  se INTEGER,
  cvr INTEGER,
  name TEXT NOT NULL,
  type company_type NOT NULL
);

CREATE TABLE tax_record (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  taxable_income BIGINT NOT NULL,
  year SMALLINT NOT NULL,
  deficit BIGINT NOT NULL,
  corporate_tax BIGINT NOT NULL,
  company_cvr INTEGER NOT NULL,
  company_se INTEGER NOT NULL,
  FOREIGN KEY (company_cvr, company_se) REFERENCES company (cvr, se)
);

-- migrate:down
DROP TABLE company CASCADE;
DROP TABLE tax_record CASCADE;
DROP TYPE company_type;
