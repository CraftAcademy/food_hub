Then("I should see {string}") do |expected_text|
  expect(page).to have_content expected_text
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end

Then("I should see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipes', text: recipe_title)).to have_content expected_text
end

Then("I should not see {string} in {string} recipe") do |expected_text, recipe_title|
  expect(page.find('.recipes', text: recipe_title)).to have_no_content expected_text
end
