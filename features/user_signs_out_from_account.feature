Feature: User signs out
As a user
In order to keep my account safe
I would like to be able to sign out

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

Scenario: User signs out
Given I am logged in as "maran@test.com"
When I click "Sign out"
Then  I should be on root path
And   I see ‘“You have successfully signed out"
