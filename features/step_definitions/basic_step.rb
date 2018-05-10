Given('I visit the site') do
  visit root_path
end

When('I click {string}') do |link|
  click_link_or_button link
end

When('I fill in {string} with {string}') do |field, text|
  fill_in field, with: text
end

Given("We have the following fields:") do |table|
table.hashes.each do |field|
    FactoryBot.create(:user)
  end
end
