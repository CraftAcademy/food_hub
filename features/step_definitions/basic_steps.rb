Given("I visit site") do
  visit root_path
end

Given("We have the following list:") do |table|
  table.hashes.each do |recipe|
    # category = Category.find_by(name: product[:category])
    Recipe.create(title: recipe[:title], decsription: recipe[:decsription], ingredients: recipe[:ingredients], directions: recipe[:directions])
  end
end
