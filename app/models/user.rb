class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :companies, through: :usercompany
  has_many :companies
  has_many :job_offers, through: :companies
  has_many :job_applications, through: :job_offers
  has_many :applicants, through: :job_applications, source: :user

  has_many :job_solicitations, class_name: 'JobApplication'

  mount_uploader :photo, PhotoUploader
end
