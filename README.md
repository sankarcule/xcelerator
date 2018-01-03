# Xcelerator [![Build Status](https://travis-ci.org/sankarcule/xcelerator.svg?branch=master)](https://travis-ci.org/sankarcule/xcelerator)

For localserver - Visit Api Docs: http://localhost:3000/api_docs/swagger/#


* Tech stack - Ruby on Rails

* DB - PostgreSQL

* Test cases - RSpec

* Requirements: Ruby 2.4.1, Rails 5.1.4

* Build test - Travis CI

* API docs - Swaggard gem

 Authentication is done by generating token for each registered and signed in user and saving it in Api_key table. Topics of interest can be added to each user in the user_interests table. All requests need token for validation.
