# frozen_string_literal: true

class JobOffer < ApplicationRecord
  CONTRACT_CATEGORIES = %w[Internship Fixed-Term\ Contract Permanent\ Contract].freeze

  has_many :job_applications, dependent: :destroy
  belongs_to :company

  validates :company_name, :category, :title, :description, :phone_number, :address, presence: true
  validates :category, inclusion: { in: CONTRACT_CATEGORIES,
                                    message: '%{value} is not a valid contract category' }
  validate :start_date_cannot_be_in_the_past, on: :create
  validate :end_date_cannot_be_in_the_past, on: :create
  validate :end_date_after_start_date?
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
  validates :phone_number, length: { in: 6..15 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date.past?
      errors.add :start_date, "can't be in the past"
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date.past?
      errors.add :end_date, "can't be in the past"
    end
  end

  def start_date_cannot_be_after_end_date
    if end_date.present? && end_date.past?
      errors.add :end_date, "can't be in the past"
    end
  end

  def end_date_after_start_date?
    errors.add :end_date, 'must be after start date' if end_date < start_date
  end

  def self.current_offers
    where('start_date > ?', DateTime.yesterday)
  end

  def self.old_offers
    where('start_date < ?', DateTime.now)
  end
end
