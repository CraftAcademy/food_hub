Given('We have the following user:') do |table|
  table.hashes.each do |field|
    create(:user, field)
  end
end

Given('We have the following recipes:') do |table|
  table.hashes.each do |recipe|
    if recipe[:user]
      recipe[:user] = User.find_by email: recipe[:user]
    end

    if recipe["forked from"]
      recipe[:original_recipe_id] = Recipe.find_by(title: recipe["forked from"]).id if recipe["forked from"] != ""
      recipe.delete("forked from")
    end

    if recipe[:category]
      recipe[:category] = Category.find_by name: recipe[:category]
    end

    new_recipe = create(:recipe, recipe.except('image'))

    if recipe[:image]
      new_recipe.image.attach(io: File.open("#{::Rails.root}/spec/fixtures/#{recipe[:image]}"),
                              filename: "#{recipe[:image]}",
                              content_type: "image/png")
    end
  end
end
