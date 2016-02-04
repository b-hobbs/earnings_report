# Earnings Report
A simple API to get the average salary of a given position based on [Boston Employee Earnings Report](https://data.cityofboston.gov/Finance/Employee-Earnings-Report-2014/4swk-wcg8) 

Creates a basic wrapper for the [SODA API](https://dev.socrata.com/docs/queries/) and uses that to get the average salary for the position.

Uses Ruby on Rails and Rails' built in testing. In hindsight, Rails was complete overkill for this small project but my Rails skills were rusty and I wanted to play around with it. I had also never used Rails' built in testing framework. 

## Usage
Get the average salary for a given position title

GET /position/:title/salary

## Example
GET http://localhost:3000/position/Nurse%20Case%20Manager/salary

RESPONSE {"avg_total_earnings":"84167.210000000000"}

## Tests Result
Run options: --verbose --seed 30405

EarningReportControllerTest#test_should_get_average_earnings = 0.57 s = .
EarningReportTest#test_should_create_array_of_select_clauses = 0.00 s = .
EarningReportTest#test_should_be_able_to_chain_select = 0.00 s = .
EarningReportTest#test_should_build_the_query_string = 0.00 s = .
EarningReportTest#test_should_set_one_where_condition = 0.00 s = .
EarningReportTest#test_should_get_result_from_api = 0.22 s = .
EarningReportTest#test_should_overwrite_where_condition_when_chaining = 0.00 s = .
EarningReportTest#test_should_add_one_select_clause_as_array = 0.00 s = .

Finished in 0.798851s, 10.0144 runs/s, 11.2662 assertions/s.

8 runs, 9 assertions, 0 failures, 0 errors, 0 skips
