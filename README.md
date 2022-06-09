## Features included
    - Authentication/sessions
    - User registration and crud
    - Issues crud
    - Issue Comments Crud
    - Issue likeable
    - Comments likebale
    - Pagination
    - Issue filtering (added ransack sort/search/filter)
    - Rich Text with files/images using trix and actiontext
    - Swagger for Api Docs
    - Handled api errors gracefully.

## Getting Started
1.  Make sure that you have Rails 6, PostgreSQL, Redis, git cli, and bundle installed.
3.  Update the values of the `.env.sample` file to match your app
4.  Create your `.env` file. You have an example at `.env.sample`.
5.  Run `bundle install`
6.  Run `bundle exec rake db:create`
7.  Run `bundle exec rake db:migrate`
8.  Run `bundle exec rake db:seed`
8.  Run `gem install foreman`
9.  Check the test are passing running `rspec`
    _At this point you can run `foreman start`  and start making your REST API calls at `http://localhost:5000`_

## Tests

You can run the unit tests with `rspec` or `rspec` followed by a specific test file or directory.
