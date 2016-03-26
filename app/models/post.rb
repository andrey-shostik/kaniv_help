class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, length: { maximum: 50 }
  validates :title, :body, presence: :true

  delegate :name, to: :user
  paginates_per 3
end
