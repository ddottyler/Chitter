# frozen_string_literal: true

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_new_test')
else
  DatabaseConnection.setup('chitter_new')
end
