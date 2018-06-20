class Recipe < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  belongs_to :user
  has_and_belongs_to_many :collections, uniq: true

  update_index('recipes') { self }
  
  after_create :notify

  def notify
    ActionCable.server.broadcast 'notifications',
                                  message: "<p>#{self.title} was created!</p>"
  end
end
