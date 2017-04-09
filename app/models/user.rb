class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :gifs, through: :favorites

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :password, presence: true

  enum role: %w(default admin)
end
