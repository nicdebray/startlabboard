class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  before_action :set_job_offer, only: [:new, :create, :update, :destroy]

  def index
    @job_applications = JobApplications.all
  end

  def show
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.job_offer = @job_offer
    if @job_application.save
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_offer.update(job_application_params)
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  def destroy
    if @job_application.destroy
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def set_job_offer
    @job_offer = JobOffer.find(params[:job_offer_id])
  end

  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :email, :motivation, :job_offer_id, :job_application_id)
  end

end
