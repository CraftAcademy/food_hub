Feature: User signs out
  As a user
  In order to keep my account safe
  I would like to be able to sign out

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

Scenario: User signs out
  Given I visit login page
  And I fill in "Email" with "maran@test.com"
  And I fill in "Password" with "12345678"
  And I click "Log in"
  Then I should see "Signed in successfully."
  When I click "Sign Out"
  Then I should be redirected to index page
  And I should see "Signed out successfully."
