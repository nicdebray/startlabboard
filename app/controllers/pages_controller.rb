class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    last_offers(3)
    @companies = Company.all
  end

  private

  def last_offers(latest)
    @job_offers_last = JobOffer.all.where(published: true).where('start_date > ?', DateTime.yesterday).order('created_at DESC').limit(latest)
  end
end
