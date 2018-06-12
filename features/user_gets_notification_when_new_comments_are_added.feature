Feature: User gets notification when new comments are added
  As a user
  In order to get informed of new comments on a recipe
  I would like to receive a notification

  Background:
    Given We have the following user:
      | email           | password    |
      | maran2@test.com  | 12345678    |

    And We have the following recipes:
      | title       	|
      | Meatball-Stew |

    Scenario: A user can see when someone comments on a recipe
      Given I visit the site
      And "maran2@test.com" is logged-in in another window
      And He is on the show page for "Meatball-Stew"
      And I fill in "Body" with "I got sick, how do i sue you?"
      And I click "Create Comment"
      And I switch to a new window
      Then I should see "maran2@test.com left a comment on Meatball-Stew"
