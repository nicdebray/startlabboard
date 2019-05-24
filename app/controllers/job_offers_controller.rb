class JobOffersController < ApplicationController
  before_action :set_job_offer, only: [:show, :edit, :update, :destroy]

  def index
    @job_offers = current_user.job_offers.all
  end

  def show
  end

  def new
    @job_category = %w(CDI CDD Internship)
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    if @job_offer.save
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_offer.update(job_offer_params)
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def destroy
    if @job_offer.destroy
      redirect_to job_offers_path
    else
      render :new
    end
  end

  private

  def set_job_offer
    @job_offer = JobOffer.find(params[:id])
  end

  def job_offer_params
    params.require(:job_offer).permit(:company, :category, :title, :description, :start_date, :end_date, :phone_number, :email, :location, :job_offer_id)
  end
end
