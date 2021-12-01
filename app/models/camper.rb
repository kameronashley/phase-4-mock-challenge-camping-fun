class Camper < ApplicationRecord
  has_many :signups, dependent: :destroy
  has_many :activities, through: :singups

  validates :name, presence: true
  validates :age, inclusion: {8..18}
end
