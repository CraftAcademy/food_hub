Feature: User can rate recipes
  As a user
  In order to evaluate recipes
  I would like to be able to rate recipes

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

  Given We have the following recipes:
    | title       	| description                 | ingredients        | directions              | user            |
    | Meatball-Stew | This will make you sick     | Meat, onion, stuff | Stir it, mix it, eat it | maran@test.com  |

  And I am logged in as "rater@test.com"

@javascript
Scenario: User can rate a recipe when visiting the recipe page
  When I am on the show page for "Meatball-Stew"
  And I click "5" on rating
  #Then I should see the notice: "Thank you for your rating"
  And the average rating for "Meatball-Stew" should be "5"
