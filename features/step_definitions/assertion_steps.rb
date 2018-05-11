Then("I should see {string}") do |expected_text|
  expect(page).to have_content expected_text
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path
end

Then("I should be on password reset page") do
  expect(current_path).to eq new_user_password_path
end
