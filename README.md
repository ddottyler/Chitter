# Chitter

### Project overview

This is a small Twitter clone that will allow users to post messages to a public stream.

**Notes on functionality included**

- You don't have to be logged in to see the peeps.
- Users sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.

### Getting started

Once you have cloned this project:

1. `sh bunndle install`
2. Connect to psql
3. Create two databases using the psql command
   `sh CREATE DATABASE chitter_new;`
   `sh CREATE DATABASE chitter_new_test `
4. Connect to each database using the pqsl command
   `sh \c chitter_new;`
5. Run the query saved in the file db/migrations files

### Running the project

`sh rackup`

### Running tests

`rspec`

### Technologies used

- Ruby
- Sinatra
- Capybara
- Rspec
- Bcrypt

### Next steps on the project

1. User names to be added to each users peep
2. Styling to be added to all pages and elements
3. Functional navbar
4. Follow other users feature
5. Delete button to be added to comments
6. Circle CI to be added
7. Test coverage to be added
8. Add project to Heroku
