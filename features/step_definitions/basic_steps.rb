Given('I visit the site') do
  visit root_path
end

Given("I visit the login page") do
  visit new_user_session_path
end

When('I click {string}') do |link|
  click_link_or_button link
end

When('I fill in {string} with {string}') do |field, text|
  fill_in field, with: text
end

Given('We have the following user:') do |table|
  table.hashes.each do |field|
    create(:user, field)
  end
end

Given('We have the following recipes:') do |table|
  table.hashes.each do |recipe|
    if recipe[:user]
      recipe[:user] = User.find_by email: recipe[:user]
    end

    if recipe["forked from"]
      recipe[:original_recipe_id] = Recipe.find_by(title: recipe["forked from"]).id if recipe["forked from"] != ""
      recipe.delete("forked from")
    end

    if recipe[:category]
      recipe[:category] = Category.find_by name: recipe[:category]
    end

    new_recipe = create(:recipe, recipe.except('image'))

    if recipe[:image]
      new_recipe.image.attach(io: File.open("#{::Rails.root}/spec/fixtures/#{recipe[:image]}"),
                              filename: "#{recipe[:image]}",
                              content_type: "image/png")
    end
  end
end

Given("I am logged in as {string}") do |user_email|
  @user =  user = User.find_by(email: user_email) || create(:user, email: user_email)
  login_as @user, scope: :user
end

Given("the facebook authentication is not granted") do
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

Given("the facebook response is missing email") do
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_response_without_email)
end

Given("I visit the edit page for {string}") do |string|
  recipe = Recipe.find_by(title: string)
  visit edit_recipe_path(recipe)
end

Given("I am on the {string} recipe show page") do |recipe_title|
  recipe = Recipe.find_by title: recipe_title
  visit recipe_path(recipe)
end

Given("We have the following categories:") do |table|
  table.hashes.each do |category|
  create(:category, category)
  end
end

Given("I select {string} from category menu") do |option|
  select option, from: 'recipe_category_id'
end

Given("{string} is logged-in in another window") do |email|
  window = open_new_window
  switch_to_window(window)
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given("He/I is/am on the show page for {string}") do |recipe_title|
  recipe = Recipe.find_by(title: recipe_title)
  visit recipe_path(recipe)
end

Given("I switch to window {string}") do |index|
  switch_to_window(windows[index.to_i - 1])
end

When("I click {string} on rating") do |value|
  within('#rating') do
    click_on value
  end
  sleep 2
end

Then("stop") do
  sleep 2
end

Given("I attach file") do
  attach_file('recipe_image', "#{::Rails.root}/spec/fixtures/pizza.png")
end

Given("I am on the {string} page") do |recipe_title|
  recipe = Recipe.find_by title: recipe_title
  visit recipe_path(recipe)
end

When("I visit My Collection page") do
  visit collections_path
end

Given("I have {string} in My Collection") do |recipe_title|
  recipe = create(:recipe, title: recipe_title)
  @user.collection.recipes << recipe
end
