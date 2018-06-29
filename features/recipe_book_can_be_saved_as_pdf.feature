Feature: Recipe book can be saved as pdf
  As a user
  In order to have an offline copy of my recipe book
  I would like to be able to view and download the recipe book as pdf

  Background:
    Given We have the following user:
      | email           |
      | maran@test.com  |
      | author@test.com |

    And We have the following recipes:
      | title           | description             | ingredients        | directions              | user            |
      | Meatball-Stew   | This will make you sick | Meat, onion, stuff | Stir it, mix it, eat it | maran@test.com  |
      | Pizza           | Amazing taste           | Weat, Water        | Mix it together         | author@test.com |
      | Grilled Chicken | Delicious taste         | Chicken            | Grill it                | maran@test.com  |

    And "maran@test.com" has the following recipes in his collection:
      | title         |
      | Meatball-Stew |
      | Pizza         |

  @javascript
  Scenario: User saves recipe book as pdf
    Given I am logged in as "maran@test.com"
    And I visit My Collection page
    When I click "Create Recipe Book"
    Then I should see "Your Recipe book has been created"
    And I should be on My Collection page
    Then a recipe book should be created
    And the pdf should contain "Meatball-Stew"
    And the pdf should contain "maran@test.com"
    And the pdf should contain "This will make you sick"
    And the pdf should contain "Meat, onion, stuff"
    And the pdf should contain "Stir it, mix it, eat it"
    And the pdf should contain "Pizza"
    And the pdf should contain "author@test.com"
    And the pdf should contain "Amazing taste"
    And the pdf should contain "Weat, Water"
    And the pdf should contain "Mix it together"

  @javascript
  Scenario: User has no recipies in his collection
    Given I am logged in as "author@test.com"
    And I visit the site
    And I click "My Collection"
    When I click "Create Recipe Book"
    Then I should see "There's nothing to put in your book. Please add some recipes first"

  @javascript
  Scenario: User views pdf
    Given I am logged in as "maran@test.com"
    And I visit My Collection page
    And I click "Create Recipe Book"
    And I click "View PDF"
    Then I should see the pdf in a new window

  @javascript
  Scenario: User can see View PDF link after refreshing
    Given I am logged in as "maran@test.com"
    And I visit My Collection page
    And I click "Create Recipe Book"
    Then I should see a "View PDF" link
    And I refresh the page
    Then I should still see a "View PDF" link
