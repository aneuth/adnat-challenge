class Organisation < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :shifts

  validates :name, uniqueness: { case_sensitive: false }
  validates :hourly_rate, presence: true
end
