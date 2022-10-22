@Login
Feature: Login


@ValidationLogin
Scenario Outline: Validating login feature
  Given I am in login page
  When I login with e-mail "<Email>" and password "<Password>"
  Then I expect to see "<Message>"

Examples:
|Email                  |Password    |Message                                                                  |
|                       |12345678    |Epic sadface: Username is required                                       |
|testautomation@test.com|            |Epic sadface: Password is required                                       |
|test                   |123456789203|Epic sadface: Username and password do not match any user in this service|
|standard_user          |secret_sauce|PRODUCTS                                                                 |
