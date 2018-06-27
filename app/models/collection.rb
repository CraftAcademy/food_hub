class Collection < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :recipes
  has_one_attached :pdf
end
