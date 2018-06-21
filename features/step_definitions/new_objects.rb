Given('We have the following user:') do |table|
  table.hashes.each do |field|
    create(:user, field)
  end
end

Given('We have the following recipes:') do |table|
  table.hashes.each do |recipe|
    if recipe[:user] && recipe[:image]
      user = User.find_by email: recipe[:user]
      recipe_hash = recipe.except('user', 'image')
      new_recipe = create(:recipe, recipe_hash.merge(user: user))
      new_recipe.image.attach(io: File.open("#{::Rails.root}/spec/fixtures/#{recipe[:image]}"),
                              filename: "#{recipe[:image]}",
                              content_type: "image/png")
    elsif recipe[:user]
      user = User.find_by email: recipe[:user]
      recipe = recipe.except('user')
      create(:recipe, recipe.merge(user: user))
    elsif recipe[:category]
      category = Category.find_by name: recipe[:category]
      recipe = recipe.except('category')
      create(:recipe, recipe.merge(category: category))
    else
      create(:recipe, recipe)
    end
  end
end
