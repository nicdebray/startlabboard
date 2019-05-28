class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    last_offers(3)
  end

  private

  def last_offers(latest)
    @job_offers_last = JobOffer.all.order('created_at DESC').limit(latest)
  end
end
