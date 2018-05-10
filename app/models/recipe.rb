class Recipe < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
end
