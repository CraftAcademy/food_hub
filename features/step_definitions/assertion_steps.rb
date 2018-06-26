Then("I should see {string}") do |expected_text|
  expect(page).to have_content expected_text
end

Then("I should see the notice: {string}") do |expected_text|
  notice = page.evaluate_script("document.querySelector('.notice');")
  expect(notice.text).to eq expected_text
end

Then("I should see the alert: {string}") do |expected_text|
  alert = evaluate_script("var notice = document.querySelector('.alert'); notice.innerText")
  expect(alert).to eq expected_text
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end

Then("I should be redirected to the signup page") do
  expect(current_path).to eq new_user_registration_path
end

Then("I should see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipes', text: recipe_title)).to have_content expected_text
end

Then("I should not see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipes', text: recipe_title)).to have_no_content expected_text
end

Then("show me the page") do
  save_and_open_page
end

Then("I should not see {string}") do |string|
  expect(page).to have_no_content string
end

Then("I should see {string} in {string} section") do |expected_text, section_name|
  section_id = "#" + section_name.downcase.split.join('-')
  expect(page.find(section_id)).to have_content expected_text
end

Then("I should be on the {string} edit page") do |recipe_title|
  recipe = Recipe.find_by title: recipe_title
  expect(current_path).to eq edit_recipe_path(recipe)
end

Then("I should see the {string} image") do |file_name|
  expect(page).to have_selector "img[src$='#{file_name}']"
end

Then("I should be on password reset page") do
  expect(current_path).to eq new_user_password_path
end

Then("the average rating for {string} should be {string}") do |recipe_title, expected_rating|
  recipe = Recipe.find_by(title: recipe_title)
  expect(recipe.calc_average_rating).to eq expected_rating.to_i
end

Then("I refresh the page") do
  page.driver.browser.navigate.refresh
end

Then("I should be on My Profile page") do
  expect(current_path).to eq user_path(@user)
end

Then("I should be on the login page") do
  expect(current_path).to eq new_user_session_path
end
