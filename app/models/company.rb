class Company < ApplicationRecord
  has_many :users, through: :usercompany
  has_many :job_offers, dependent: :destroy
  belongs_to :user

  validates :name, :address, presence: { message: 'must be provided' }
  validates :name, uniqueness: { case_sensitive: false }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
