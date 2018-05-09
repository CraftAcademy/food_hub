When("I click {string}") do |link|
  click_link_or_button link
end
When("I fill in {string} with {string}") do |field, text|
  fill_in field, with: text
end

