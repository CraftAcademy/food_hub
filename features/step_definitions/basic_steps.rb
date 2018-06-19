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
end

Then("stop") do
  binding.pry
end
