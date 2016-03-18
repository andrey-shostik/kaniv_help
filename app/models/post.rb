class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { maximum: 35 }
end
