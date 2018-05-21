Feature:
  As a user
  In order to protect recipes from being edited by others
  I need recipes I create to belong to me

  Background:
    Given We have the following user:
      | email             |
      | maran@test.com    |
      | stefan@test.com   |

    And We have the following recipes:
      | title       	| user             |
      | Meatball-Stew | maran@test.com   |
      | Camel Tartar  | stefan@test.com  |

    And I visit the site

  Scenario: Visitor can see authors email on index page
    Then I should see "Posted by: maran@test.com" in "Meatball-Stew" recipe
    And I should see "Posted by: stefan@test.com" in "Camel Tartar" recipe
    And I should not see "Posted by: stefan@test.com" in "Meatball-Stew" recipe
    And I should not see "Posted by: maran@test.com" in "Camel Tartar" recipe

  Scenario: Visitor can see authors email on recipe page
    When I click "Meatball-Stew"
    Then I should see "Posted by: maran@test.com"
