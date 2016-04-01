class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  # validates :name, presence: true, uniqueness: { scope: :post_id }
end
