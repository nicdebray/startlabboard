class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :companies, through: :usercompany
  has_many :companies
  has_many :job_applications
  has_many :companies, through: :job_applications
end
