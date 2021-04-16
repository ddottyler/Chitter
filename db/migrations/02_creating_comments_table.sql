-- Database - chitter_new
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES chitters (id));

-- Database - chitter_new_test
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES chitters (id));