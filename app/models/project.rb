class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  has_many :users, through: :pledges
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  def self.search(search)
  where("title ILIKE ?", "%#{search}%")
  end

end
