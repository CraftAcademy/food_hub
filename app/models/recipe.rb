class Recipe < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  belongs_to :user

  after_create :notify

  def notify
    ActionCable.server.broadcast 'notifications',
                                  message: "<p>#{self.title} was created!</p>"
  end

  def fork(user)
    forked_recipe = self.dup
    forked_recipe.user = user
    forked_recipe.original_recipe_id << self.id
    forked_recipe.title = 'Forked ' + forked_recipe.title
    forked_recipe.forked_recipes_ids = []
    forked_recipe.save

    self.forked_recipes_ids << forked_recipe.id
    self.save
    return forked_recipe
  end
end
