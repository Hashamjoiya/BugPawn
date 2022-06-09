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

##Filtering quide

*=>db_field

| Predicate | Description | Notes |
| ------------- | ------------- |-------- |
| `*_eq`  | equal  | |
| `*_not_eq` | not equal | |
| `*_matches` | matches with `LIKE` | e.g. `q[email_matches]=%@gmail.com`|
| `*_does_not_match` | does not match with `LIKE` | |
| `*_matches_any` | Matches any | |
| `*_matches_all` | Matches all  | |
| `*_does_not_match_any` | Does not match any | |
| `*_does_not_match_all` | Does not match all | |
| `*_lt` | less than | |
| `*_lteq` | less than or equal | |
| `*_gt` | greater than | |
| `*_gteq` | greater than or equal | |
| `*_present` | not null and not empty | Only compatible with string columns. Example: `q[name_present]=1` (SQL: `col is not null AND col != ''`) |
| `*_blank` | is null or empty. | (SQL: `col is null OR col = ''`) |
| `*_null` | is null | |
| `*_not_null` | is not null | |
| `*_in` | match any values in array | e.g. `q[name_in][]=Alice&q[name_in][]=Bob` |
| `*_not_in` | match none of values in array | |
| `*_lt_any` | Less than any |  SQL: `col < value1 OR col < value2` |
| `*_lteq_any` | Less than or equal to any | |
| `*_gt_any` | Greater than any | |
| `*_gteq_any` | Greater than or equal to any | |
| `*_lt_all` | Less than all | SQL: `col < value1 AND col < value2` |
| `*_lteq_all` | Less than or equal to all | |
| `*_gt_all` | Greater than all | |
| `*_gteq_all` | Greater than or equal to all | |
| `*_not_eq_all` | none of values in a set | |
| `*_start` | Starts with | SQL: `col LIKE 'value%'` |
| `*_not_start` | Does not start with | |
| `*_start_any` | Starts with any of | |
| `*_start_all` | Starts with all of | |
| `*_not_start_any` | Does not start with any of | |
| `*_not_start_all` | Does not start with all of | |
| `*_end` | Ends with | SQL: `col LIKE '%value'` |
| `*_not_end` | Does not end with | |
| `*_end_any` | Ends with any of | |
| `*_end_all` | Ends with all of | |
| `*_not_end_any` | | |
| `*_not_end_all` | | |
| `*_cont` | Contains value | uses `LIKE` |
| `*_cont_any` | Contains any of | |
| `*_cont_all` | Contains all of | |
| `*_not_cont` | Does not contain |
| `*_not_cont_any` | Does not contain any of | |
| `*_not_cont_all` | Does not contain all of | |
| `*_i_cont` | Contains value with case insensitive | uses `ILIKE` |
| `*_i_cont_any` | Contains any of values with case insensitive | |
| `*_i_cont_all` | Contains all of values with case insensitive | |
| `*_not_i_cont` | Does not contain with case insensitive |
| `*_not_i_cont_any` | Does not contain any of values with case insensitive | |
| `*_not_i_cont_all` | Does not contain all of values with case insensitive | |
| `*_true` | is true | |
| `*_false` | is false | |
