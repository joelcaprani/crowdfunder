class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  validates :dollar_amount, :numericality => { :greater_than => 0.01, :allow_blank => true }
end
