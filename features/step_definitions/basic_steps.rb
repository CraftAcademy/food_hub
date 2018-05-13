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

Given('We have the following user') do |table|
  table.hashes.each do |_field|
    create(:user)
  end
end

Given("I am logged in as {string}") do |user_email|
  login_as User.find_by(email: user_email)
end

Given(/^We have the following (?:recipes|list):$/) do |table|
  table.hashes.each do |recipe|
    create(:recipe, recipe)
  end
end
