@Login 
Feature: Login


@ValidationLogin 
Scenario Outline: Validating login feature
  Given I am in login page
  When I fill the e-mail "<email>" and password "<password>"
  And I click to login
  Then I expect to see "<message>"

Exemplos:
|email                  |pasword |message                   |
|                       |12345678|Invalid email or password.|
|testautomation@test.com|        |Invalid email or password.|
|testautomation@test.com|12345678|My Dashboard              |