class User < ActiveRecord::Base
  has_secure_token
  has_secure_password

  has_many :posts

  validates :email, uniqueness: :true
  validates :email, :password, :first_name, :last_name, presence: :true

  def name
     "#{last_name} #{first_name}"
  end
end
