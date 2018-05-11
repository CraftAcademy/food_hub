Feature: User resets forgotten password
  As a user
  In order to use the site
  I should be able to reset my password if forgotten

Scenario: User resets password for account
  Given I visit the site
  And I click "Login"
  And I click "Forgot your password?"
  Then I am on password reset page
  And I fill in "Email" with "maran@test.com"
  And I click "Send me reset password instructions"
  Then I should see "You will receive an email with instructions on how to reset your password in a few minutes."
