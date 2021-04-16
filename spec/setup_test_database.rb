require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_new_test')
  connection.exec("TRUNCATE chitters, comments, users;")
end 