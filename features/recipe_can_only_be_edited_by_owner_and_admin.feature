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