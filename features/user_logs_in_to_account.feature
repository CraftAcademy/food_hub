Feature: User logs in to account
  As a user
  In order to see my dashboard
  I need to be able to login

Background:
  Given We have the following user
    | name    | email           | password    |
    | Maran   | maran@test.com  | 12345678    |

Scenario: User can log in with valid credentials
  Given I visit the site
  When I click "Login"
  And I fill in "Email" with "maran@test.com"
  And I fill in "Password" with "12345678"
  And I click "Log in"
  Then I should see "Signed in successfully."

Scenario: User provides wrong password
  Given I visit the site
  When I click "Login"
  And I fill in "Email" with "maran@test.com"
  And I fill in "Password" with "101dream"
  And I click "Log in"
  Then I should see "Invalid Email or password."

Scenario: User fails to provide email
  Given I visit the site
  When I click "Login"
  And I fill in "Email" with ""
  And I fill in "Password" with "12345678"
  And I click "Log in"
  Then I should see "Invalid Email or password."

Scenario: User fails to provide valid email
  Given I visit the site
  When I click "Login"
  And I fill in "Email" with "maran"
  And I fill in "Password" with "12345678"
  And I click "Log in"
  Then I should see "Invalid Email or password."
