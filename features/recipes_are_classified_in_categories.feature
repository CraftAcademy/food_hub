Feature: Recipes are classified in categories
  As a user
  In order to find a desired recipe
  Recipes should be classified by category

  Background:
    Given We have the following categories:
      | name         |
      | Starters     |
      | Main Courses |
      | Desserts     |

    And We have the following recipes:
      | name           | description              | category      |
      | Meatball-Stew  | This will make you sick  | Main Courses  |

    Scenario: User should see categories
      Given I visit the site
      Then I should see "Starters"
      And I should see "Main Courses"
      And I should see "Desserts"
