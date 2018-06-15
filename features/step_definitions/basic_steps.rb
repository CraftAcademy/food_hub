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
      user = User.find_by email: recipe[:user]
      recipe = recipe.except('user')
      create(:recipe, recipe.merge(user: user))
    elsif recipe[:category]
      category = Category.find_by name: recipe[:category]
      recipe = recipe.except('category')
      create(:recipe, recipe.merge(category: category))
    else
      create(:recipe, recipe)
    end
  end
end

Given("I am logged in as {string}") do |user_email|
  login_as User.find_by(email: user_email)
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

Given("We have the following categories:") do |table|
  table.hashes.each do |category|
  create(:category, category)
  end
end

Given("{string} is logged-in in another window") do |email|
  window = open_new_window
  switch_to_window(window)
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given("He is on the show page for {string}") do |recipe_title|
  recipe = Recipe.find_by(title: recipe_title)
  visit recipe_path(recipe)
end

Given("I switch to window {string}") do |index|
  switch_to_window(windows[index.to_i - 1])
end
