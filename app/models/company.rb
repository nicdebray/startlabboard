class Company < ApplicationRecord
  has_many :users, through: :usercompany
  has_many :job_offers, dependent: :destroy
  belongs_to :user

  validates :name, presence: { message: 'must be provided}' }
  validates :name, uniqueness: { case_sensitive: false }

end
