class User < ActiveRecord::Base
  has_secure_token
  has_secure_password

  has_many :posts

  validates :password, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :first_name, :last_name, presence: :true
end
