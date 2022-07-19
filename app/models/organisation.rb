class Organisation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :shifts, through: :users
end
