# frozen_string_literal: true

class JobOffersController < ApplicationController
  before_action :set_company_show, only: [:show]
  before_action :set_company, only: %i[new create edit update destroy]
  before_action :set_job_categories, only: %i[new edit]
  before_action :set_job_offer, only: %i[show edit update destroy]

  skip_before_action :authenticate_user!, only: :index

  def index
    all_job_offers = policy_scope(JobOffer)
    @job_offers = all_job_offers.current_offers
    @job_offers_old = all_job_offers.old_offers
    @job_offers_published_open = @job_offers.where(published: true) #  reusing what we have to stay dry
    @job_offers_published_old = @job_offers_old.where(published: true) # ditto
  end

  def show; end

  def new
    @job_offer = JobOffer.new
    @job_offer.company = @company
    authorize @job_offer
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.company = @company
    authorize @job_offer
    if @job_offer.save
      redirect_to company_job_offer_path(@company, @job_offer)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job_offer.update(job_offer_params)
      redirect_to company_job_offer_path(@company, @job_offer)
    else
      render :new
    end
  end

  def destroy
    if @job_offer.destroy
      redirect_to company_job_offers_path(@company)
    else
      render :new
    end
  end

  def toggle_published
    set_job_offer
    @job_offer.published = !@job_offer.published
    @job_offer.save
  end

  def my_job_offers
    all_job_offers = policy_scope(current_user.job_offers) # Active Record Model already has the association
    @my_job_offers = all_job_offers.current_offers #  Let s stay Dry
    @my_job_offers_old = all_job_offers.old_offers #  dottp
  end

  private

  def set_job_categories
    @job_category = JobOffer::CONTRACT_CATEGORIES # So it's the same array all over the app
  end

  def set_job_offer
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer
  end

  def set_company_show
    @company = JobOffer.find(params[:id]).company_id
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def job_offer_params
    params.require(:job_offer).permit(:company_id, :company_name, :category, :title, :description, :start_date, :end_date, :phone_number, :email, :address, :job_offer_id, :published)
  end
end
