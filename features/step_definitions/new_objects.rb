Given('We have the following user:') do |table|
  table.hashes.each do |field|
    create(:user, field)
  end
end

Given('We have the following recipes:') do |table|
  table.hashes.each do |recipe|
    if recipe[:user]
      user = User.find_by email: recipe[:user]
      recipe = recipe.except('user')
      create(:recipe, recipe.merge(user: user))
    else
      create(:recipe, recipe)
    end
  end
end
