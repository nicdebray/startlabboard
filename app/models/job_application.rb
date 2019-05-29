class JobApplication < ApplicationRecord
  belongs_to :job_offer
  belongs_to :user

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
  validates_uniqueness_of :job_offer_id, scope: :user_id, message: "You already applied"

end
