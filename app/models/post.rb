class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  has_one :tender

  validates :title, length: { maximum: 50 }
  validates :title, :body, presence: :true

  delegate :name, to: :user
  paginates_per 3

  after_save :create_tender

  def create_tender
    create_tender!
  end
end
