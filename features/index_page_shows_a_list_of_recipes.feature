Feature: Index page shows a list of recipes
  As a user
  In order to see what recipes are available
  I would like to see a list of recipes displayed

Scenario: User views recipes on home page
  Given I visit site
  Then I should see "Recipes"
  And I should see a list of recipes
