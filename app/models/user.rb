class User < ActiveRecord::Base
  has_secure_token
  has_secure_password

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, :first_name, :last_name, :surname, presence: :true
  validates :first_name, :last_name, :surname, length: { minimum: 3 }
  validates :user_key, presence: :true, uniqueness: :true, length: { is: 6 }

  has_many :posts
  has_many :votes

  def name
    "#{last_name} #{first_name} #{surname}"
  end
end
