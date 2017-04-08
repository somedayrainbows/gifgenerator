class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :password, presence: true

  enum role: %w(default admin)
end
