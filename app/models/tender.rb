class Tender < ActiveRecord::Base
  belongs_to :post
  has_many :members
  has_many :tender_votes
end
