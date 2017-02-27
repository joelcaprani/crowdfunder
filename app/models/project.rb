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

  validate :start_date_in_future
  validate :end_date_after_start_date
  validates :goal, :numericality => { :greater_than => 0.01, :allow_blank => true }

  # def goal_has_to_be_greater_than_minimum
  #   errors.add(:goal, "goal dollar amount has to be greater than 0.01") if
  #   goal => 0.01
  # end


  def start_date_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "must be later than today!")
    end
  end

  def end_date_after_start_date
    if end_date.present? && end_date <= start_date
      errors.add(:end_date, "must be later than start date!")
    end

  end
    def self.search(search)
    where("title LIKE ?", "%#{search}%")
    end

end
