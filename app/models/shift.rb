class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organisation, optional: true
  has_many :breaks, dependent: :destroy

  accepts_nested_attributes_for :breaks

  def shift_length
    TimeDifference.between(start, finish).in_hours
  end

  def brk_length
    sum = 0
    self.breaks.each do |brk|
      sum += brk.break_length
    end
    sum
  end

  def hours_worked
    shift_length - (brk_length / 60)
  end

  def shift_cost
    hours_worked * self.user.organisation.hourly_rate
  end

  def prior_shift!
    self.prior_shift = true
  end
end
