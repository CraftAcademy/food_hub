class Recipe < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  belongs_to :user

  after_create :notify

  def notify 
    ActionCable.server.broadcast 'web_notifications_channel', 
                                  message: "<p>#{self.title} was created!</p>"
  end
end
