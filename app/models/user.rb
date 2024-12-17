class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :tasks
  has_many :categories
  # validations email address
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
  # validates password
  validates :password, confirmation: true, presence: true, length: { minimum: 3 }
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
