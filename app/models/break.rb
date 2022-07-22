class Break < ApplicationRecord
  belongs_to :shift, optional: true
  has_one :organisation, through: :shift

  validates :break_length, presence: true
end
