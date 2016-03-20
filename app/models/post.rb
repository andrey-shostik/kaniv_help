class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { maximum: 50 }
  validates :title, :body, presence: :true

  delegate :name, to: :user
  # paginates_per 10
end
