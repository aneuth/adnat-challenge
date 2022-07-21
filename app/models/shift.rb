class Shift < ApplicationRecord
  belongs_to :user, optional: true
  has_one :organisation, through: :user

  def shift_length
    TimeDifference.between(start, finish).in_hours
  end

  def hours_worked
    shift_length - (break_length / 60)
  end

  def shift_cost
    hours_worked * self.user.organisation.hourly_rate
  end

  def prior_shift!
    self.prior_shift = true
  end
end
