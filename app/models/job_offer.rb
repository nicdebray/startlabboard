class JobOffer < ApplicationRecord
  validates :title, :description, presence: true
  has_many :job_applications
end
