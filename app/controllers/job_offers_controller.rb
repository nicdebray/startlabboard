class JobOffersController < ApplicationController
  before_action :set_company_show, only: [:show]
  before_action :set_company, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_job_offer, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :index

  def index
    @job_offers = JobOffer.all
  end

  def show
  end

  def new
    @job_category = %w(Internship Fixed-Term\ Contract Permanent\ Contract)
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.company = @company
    if @job_offer.save!
      redirect_to company_job_offer_path(@company, @job_offer)
    else
      render :new
    end
  end

  def edit
  end

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

  private

  def set_job_offer
    @job_offer = JobOffer.find(params[:id])
  end

  def set_company_show
    @company = JobOffer.find(params[:id]).company_id
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def job_offer_params
    params.require(:job_offer).permit(:company_id, :company_name, :category, :title, :description, :start_date, :end_date, :phone_number, :email, :location, :job_offer_id)
  end
end
