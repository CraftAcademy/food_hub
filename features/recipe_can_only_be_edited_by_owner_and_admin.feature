Feature: Recipe can only be edited by owner and admin
    [User story]


    Background:
        Given We have the following user: 
        |email              |role |
        |user_1@random.com  |user |
        |user_2@random.com  |user |
        |admin@random.com   |admin|

     And We have the following recipes:
      | title         | user                |
      | Meatball-Stew | user_1@random.com   |
      | Meatballs     | user_2@random.com   |


    Scenario: User 1 can edit his own recipe
        Given I am logged in as "user_1@random.com"
        And I visit the site
        And I click "Meatball-Stew"
        When I click "Edit Recipe"
        And I fill in "Title" with "My Grandmas Meatballs"
        And I click "Update Recipe"
        Then I should see "You have successfully edit recipe!"
        And I should see "My Grandmas Meatballs"

    Scenario: User 2 can NOT see the edit butto on User 1's recipe
        Given I am logged in as "user_2@random.com"
        And I visit the site
        And I click "Meatball-Stew"
        Then I should not see "Edit Recipe"

    Scenario: User 2 can NOT edit User 1's recipe even if he tries to access the edit path
        Given I am logged in as "user_2@random.com"
        And I visit the edit page for "Meatball-Stew"
        Then I should see "You can NOT do this!"

    Scenario: Admin can edit all recipes [1]
        Given I am logged in as "admin@random.com"
        And I visit the site
        And I click "Meatball-Stew"
        When I click "Edit Recipe"
        And I fill in "Title" with "My Grandmas Meatballs"
        And I click "Update Recipe"
        Then I should see "You have successfully edit recipe!"
        And I should see "My Grandmas Meatballs"

    Scenario: Admin can edit all recipes [2]
        Given I am logged in as "admin@random.com"
        And I visit the site
        And I click "Meatballs"
        When I click "Edit Recipe"
        And I fill in "Title" with "My Awesome Meatballs"
        And I click "Update Recipe"
        Then I should see "You have successfully edit recipe!"
        And I should see "My Awesome Meatballs"


