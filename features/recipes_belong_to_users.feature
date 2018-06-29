Feature:
  As a user
  In order to protect recipes from being edited by others
  I need recipes I create to belong to me

  Background:
    Given We have the following user:
      | email           | full_name |
      | maran@test.com  | maran     |
      | stefan@test.com | stefan    |

    And We have the following recipes:
      | title         | user            |
      | Meatball-Stew | maran@test.com  | 
      | Camel Tartar  | stefan@test.com | 

    And I visit the site

  @javascript
  Scenario: Visitor can see authors email on index page
    Then I should see "Posted by: maran" in "Meatball-Stew" recipe
    And I should see "Posted by: stefan" in "Camel Tartar" recipe
    And I should not see "Posted by: stefan" in "Meatball-Stew" recipe
    And I should not see "Posted by: maran" in "Camel Tartar" recipe

  Scenario: Visitor can see authors name on recipe page
    When I click "Meatball-Stew"
    Then I should see "Posted by: maran"
