class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  after_create :notify

  def notify
    ActionCable.server.broadcast 'notifications',
                                  message: "<p>#{self.user.full_name} left a comment on #{self.recipe.title}.</p>"
  end
end
