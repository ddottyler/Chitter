def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_new_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end