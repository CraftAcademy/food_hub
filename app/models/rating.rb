class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates_presence_of :value, :user, :recipe

end
