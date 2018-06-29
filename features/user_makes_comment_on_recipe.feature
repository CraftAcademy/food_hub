Feature: User can comment on a recipe
  As a user
  in order to express my opinion
  I would like to comment on recipes

  Background:
    Given We have the following user:
      | email          | password | full_name |
      | maran@test.com | 12345678 | Maran     |
      | hater@test.com | 12345678 | Hater     |

    Given We have the following recipes:
      | title         | description             | ingredients        | directions              | user           |
      | Meatball-Stew | This will make you sick | Meat, onion, stuff | Stir it, mix it, eat it | maran@test.com |

  @javascript
  Scenario: User comments on a recipe
    Given I visit the site
    And I am logged in as "hater@test.com"
    When I click "Meatball-Stew"
    And I fill in "comment_body" with "I got sick, how do i sue you?"
    And I click "Comment"
    Then I should see "Thank you for your feedback"
    And I should see "I got sick, how do i sue you?"
    And I should see "Commented by: Hater"
    And I should see a "mailto" link pointing to "hater@test.com"
