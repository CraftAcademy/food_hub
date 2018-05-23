Feature: User can log in using hers/his Facebook credentials
    As a user of the system
    In order to simplify the sign up/sign in process 
    I would like to be able to authenticate myself using Facebook 


Scenario: Visitor clicks on 'Login with Facebook' and gets authenticated
    Given I visit the site
    And I click "Login with Facebook"
    Then I should be redirected to index page
    And I should see "Successfully authenticated from Facebook account" 

Scenario: Facebook authentication fails
    Given the facebook authentication is not granted
    And I visit the site
    And I click "Login with Facebook"
    Then I should be redirected to index page
    And I should see "Could not authenticate you!"

Scenario: Email is missing from Facebook responce
    Given the facebook response is missing email
    And I visit the site
    And I click "Login with Facebook"
    Then I should be redirected to the signup page
    And I fill in "Email" with "thomas@craft.se"
    And I fill in "Password" with "qwerty"
    And I fill in "Password confirmation" with "qwerty"
    And I click "Sign up"
    Then I should be redirected to index page
