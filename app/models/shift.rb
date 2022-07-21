class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organisation, optional: true
  has_many :breaks

  accepts_nested_attributes_for :breaks

  def shift_length
    TimeDifference.between(start, finish).in_hours
  end

  def break_length
    @breaks = Break.select { |brk| brk.organisation.id = user.organisation.id }
    @breaks.sum
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
