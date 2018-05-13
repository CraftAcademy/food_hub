Feature:
  As a user
  In order to protect recipes from being edited by others
  I need recipes I create to belong to me

  Background:
    Given We have the following user:
      | email           | password    |
      | maran@test.com  | 12345678    |

    And We have the following recipes:
      | title       	| description                 | ingredients        | directions              |
      | Meatball-Stew | This will make you sick     | Meat, onion, stuff | Stir it, mix it, eat it |

  Scenario: Visitor can see authors email on index page
    Given I visit the site
    Then I should see "maran@test.com"

  Scenario: Visitor can see authors email on recipe page
    Given I visit the site
    And I click "Meatball-Stew"
    Then I should see "Posted by: maran@test.com"
