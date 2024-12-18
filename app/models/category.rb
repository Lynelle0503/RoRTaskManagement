class Category < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :name
end
