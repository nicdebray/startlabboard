# frozen_string_literal: true

class Company < ApplicationRecord
  # has_many :users, through: :user_company
  has_many :job_offers, dependent: :destroy
  belongs_to :user

  validates :name, :address, presence: { message: 'must be provided' }
  validates :name, uniqueness: { case_sensitive: false }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader
end
