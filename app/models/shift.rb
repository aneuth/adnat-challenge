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

  def add_day_to_finish
    # update shift's finish date to be one day ahead of start date
    updated_finish = finish.change(day: start.day + 1)
    self.finish = updated_finish
  end

  def overnight
    # check if finish time is earlier than start time
    start.strftime("%H:%M") > finish.strftime("%H:%M")
  end
end
