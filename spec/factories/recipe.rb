 FactoryBot.define do
  factory :recipe do
    title 'MyRecipe'
    description 'A fake recipe to try cook something'
    ingredients 'Eggs, flour, tomato, meat, other stuff'
    directions 'Put stuff together and mix them, then bake them'
  #  user User.create(email: 'maran@dream.com', password: '123456')
  end
end
