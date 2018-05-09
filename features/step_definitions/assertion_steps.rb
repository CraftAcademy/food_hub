Given("I visit the site") do
  visit root_path
end

Then("I should see {string}") do |expected_text|
  expect(page).to have_content expected_text
end
