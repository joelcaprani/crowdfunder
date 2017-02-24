class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  validate :enough_pledged

  # validate :blank_spaces

  # def blank_spaces
  #   if @pledge.project(valid?)
  #     errors.add(:dollar_amount, "please fill in pledge field")
  #   end
  # end



  def enough_pledged
    unless self.dollar_amount = reward.dollar_amount
      self.errors.add(:dollar_amount, "Amount pledged must be at least $#{reward.dollar_amount}")
    end
  end

end
