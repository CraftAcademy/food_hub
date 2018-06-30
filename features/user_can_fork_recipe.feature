Feature: User can fork recipie
  As a user
  In order to customize a recipe
  I should be able to fork and edit other users recipes

Background:
  Given We have the following user:
    | email             | password |  full_name |
    | maran@test.com    | 12345678 |  Maran     |
    | author@test.com   | 12345678 |  Author    |

  And We have the following recipes:
    | title         | description             | user             |
    | Meatball-Stew | This will make you sick | author@test.com  |

  And I am logged in as "maran@test.com"

@javascript
Scenario: User forks a recipe edits its title
  Given I am on the "Meatball-Stew" recipe show page
  When I click "Fork"
  Then I should see "Recipe was sucessfully forked"
  And I wait for "6" seconds
  Then I should not see "Recipe was sucessfully forked"
  And I should be on the "Forked Meatball-Stew" edit page
  When I fill in "Title" with "Maran's Meatball-Stew"
  And I click "Update Recipe"
  Then I should see "Maran's Meatball-Stew"
  And I should see "Posted by: Maran"
  And I should see "Forked from: Meatball-Stew"

Scenario: User can see the number of forks on a recipe
  Given I am on the "Meatball-Stew" recipe show page
  Then I should not see "Forks:"
  When I click "Fork"
  And I am on the "Meatball-Stew" recipe show page
  Then I should see "1" in "Fork Button" section
