class Recipe < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  belongs_to :user

  update_index('recipes') { self }
  
  after_create :notify

  def notify
    ActionCable.server.broadcast 'notifications',
                                  message: "<p>#{self.title} was created!</p>"
  end

  def fork(user)
    forked_recipe = self.dup
    attributes = {user: user,
                  original_recipe_id: self.id,
                  title: 'Forked ' + forked_recipe.title,
                  forked_recipes_ids: []}
    forked_recipe.update_attributes(attributes)

    self.forked_recipes_ids << forked_recipe.id
    self.save
    return forked_recipe
  end

  def forked?
    self.original_recipe_id.present?
  end
end
