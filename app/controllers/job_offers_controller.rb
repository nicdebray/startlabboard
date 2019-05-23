class JobOffersController < ApplicationController
  before_action :set_joboffer, only: [:show, :edit, :update, :destroy]

  def index
    @job_offers = JobOffer.all
  end

  def show
  end

  def new
    @job_category = %w(CDI CDD Internship)
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(joboffer_params)
    if @job_offer.save
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_offer.update(joboffer_params)
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

  def set_joboffer
    @job_offer = JobOffer.find(params[:id])
  end

  def joboffer_params
    params.require(:job_offer).permit(:company, :category, :title, :description, :start_date, :end_date, :phone_number, :email, :location)
  end
end
