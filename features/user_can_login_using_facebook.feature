Feature: User can log in using his/hers Facebook credentials
As a user of the system
In order to simplify the sign up/sign in process 
I would like to be able to authenticate myself using Facebook 


Scenario: Visitor clicks on 'Login with Facebook' and gets authenticated
    Given I visit the site
    And I click "Login with Facebook"
    Then I should be redirected to index page
    And I should see "Successfully authenticated from Facebook account" 