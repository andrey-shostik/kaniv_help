class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_one :tender
  # validates :name, presence: true, uniqueness: { scope: :post_id }
end
