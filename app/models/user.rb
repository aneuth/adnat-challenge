class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  belongs_to :organisation, optional: true
  has_many :shifts, dependent: :nullify
  has_many :breaks, through: :shift
end
