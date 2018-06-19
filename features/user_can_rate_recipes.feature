Feature: User can rate recipes
  As a user
  In order to evaluate recipes
  I would like to be able to rate recipes

    Given We have the following user:
      | email           | password    |
      | maran@test.com  | 12345678    |

    And We have the following recipes:
      | title       	| description                 | ingredients        | directions              |
      | Meatball-Stew | This will make you sick     | Meat, onion, stuff | Stir it, mix it, eat it |

    And I am logged in as "maran@test.com"

  Scenario: User can rate a recipe
    Given I visit the site
    And show me the page
    When I click "Meatball-Stew"
    And I fill in "Body" with "I got sick, how do i sue you?"
    And I click "like"
    And I click "Create Comment"
    Then I should see "Thank you for your feedback"
    And I should see "I got sick, how do i sue you?"
    And I should see "Written by maran@test.com"
