Feature: User gets notification when new comments are added
  As a user
  In order to get informed of new comments on a recipe
  I would like to receive a notification

  Background:
    Given We have the following user:
      | email           | password    | full_name |
      | maran2@test.com | 12345678    | Maran2    |

    And We have the following recipes:
      | title       	|
      | Meatball-Stew |

    And I am logged in as "maran2@test.com"

    @javascript
    Scenario: A user can see when someone comments on a recipe
      Given I visit the site
      And "maran2@test.com" is logged-in in another window
      And He is on the show page for "Meatball-Stew"
      And I fill in "comment_body" with "I got sick, how do i sue you?"
      And I click "Comment"
      And I switch to window "1"
      Then I should see "Maran2 left a comment on Meatball-Stew"
      And I wait for "6" seconds
      Then I should not see "Maran2 left a comment on Meatball-Stew"
