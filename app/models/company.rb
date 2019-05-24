class Company < ApplicationRecord
  has_many :users, through: :usercompany
  has_many :job_offers, dependent: :destroy
  validates :name, presence: true
end
