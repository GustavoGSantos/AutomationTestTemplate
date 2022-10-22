@BookerApi
Feature: Restfull booker api


@AuthValidation
Scenario: Validating login feature
  When I do the request with username'admin' and password 'password123'
  Then I expect to recieve a code '200'
  And a token
