class Organisation < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :shifts
end
