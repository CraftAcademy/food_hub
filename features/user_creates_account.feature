Feature: User creates an account
  As a user
  In order to use the site
  I have to sign up and create an account

  Scenario: User can sign up
    Given I visit the site
    When I click "Sign up"
    And I fill in "Name" with "Maran"
    And I fill in "Email" with "maran@test.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click "Create"
    Then I should see "Welcome! You have signed up successfully"