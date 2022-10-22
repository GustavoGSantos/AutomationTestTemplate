@Login
Feature: Login


@ValidationLogin
Scenario Outline: Validating login feature
  Given I am in login page
  When I login with e-mail "<email>" and password "<password>"
  Then I expect to see "<message>"

  Examples:
  |email                  |password|message                   |
  |                       |12345678|Invalid email or password.|
  |testautomation@test.com|        |Invalid email or password.|
  |testautomation@test.com|12345678|My Dashboard              |
