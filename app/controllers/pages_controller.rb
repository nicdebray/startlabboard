# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    last_offers(3)
    @companies = Company.all
  end

  private

  def last_offers(limit)
    # rename and used the function to make it simpler to read
    @job_offers_last = JobOffer.current_offers.where(published: true).order('created_at DESC').limit(limit)
  end
end
