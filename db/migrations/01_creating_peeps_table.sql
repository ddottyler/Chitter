-- Database - chitter_new
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "peep" VARCHAR(100), "time" VARCHAR);
ALTER TABLE chitters
ADD "userid" INTEGER REFERENCES users (id);

-- Database - chitter_new_test
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "peep" VARCHAR(100), "time" VARCHAR);
ALTER TABLE chitters
ADD "userid" INTEGER REFERENCES users (id);