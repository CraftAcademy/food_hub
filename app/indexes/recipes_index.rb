class RecipesIndex < Chewy::Index
    define_type Recipe.all do 
        field :title
        field :description
    end
end