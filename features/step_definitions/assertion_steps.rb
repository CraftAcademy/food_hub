Then("I should see {string}") do |expected_text|
  expect(page).to have_content expected_text
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end

Then("I should be redirected to the signup page") do
  expect(current_path).to eq new_user_registration_path
end

Then("I should see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipe', text: recipe_title)).to have_content expected_text
end

Then("I should not see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipe', text: recipe_title)).to have_no_content expected_text
end


Then("show me the page") do
  save_and_open_page
end

Then("I should not see {string}") do |string|
  expect(page).to have_no_content string
end

Then("I should see the {string} image") do |file_name|
  expect(page).to have_selector "img[src$='#{file_name}']"
end
