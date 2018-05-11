Given("I visit site") do
  visit root_path
end

Given("We have the following list:") do |table|
  table.hashes.each do |recipe|
    FactoryBot.create(:recipe, recipe)
  end
end
