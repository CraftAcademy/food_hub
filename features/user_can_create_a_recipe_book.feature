Feature: User can create a recipe book
  As a user
  In order to have my favourite recipes easily available
  I would like to create my own recipe collection

Background:
  Given We have the following user:
    | email             |
    | maran@test.com    |

  And We have the following recipes:
    | title             | user           |
    | Meatball-Stew     | maran@test.com |
    | Pizza             | maran@test.com |
    | Grilled Chicken   | maran@test.com |

  And I am logged in as "maran@test.com"

@javascript
Scenario: User adds recipes to recipe book collection
  Given I am on the "Meatball-Stew" page
  And I click "Add to Collection"
  Then I should see "Recipe was added to collection"
  When I am on the "Pizza" page
  And I click "Add to Collection"
  Then I should see "Recipe was added to collection"
  When I visit My Collection page
  Then I should see "My Collection"
  And I should see "Meatball-Stew"
  And  I should see "Pizza"
  And  I should not see "Grilled Chicken"

Scenario: User removes recipes from collection
  Given I have "Pizza" in My Collection
  And I visit My Collection page
  Then I should see "Pizza"
  When I click "Remove"
  Then I should not see "Pizza"
