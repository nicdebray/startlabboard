class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  before_action :set_job_offer, only: [:new, :create, :update]

  def index
    @companies = Company.where(user_id: current_user)
    @job_applications = policy_scope(JobApplication)
  end

  def show
    authorize @job_application
  end

  def new
    @job_application = JobApplication.new
    @job_application.job_offer = @job_offer
    authorize @job_application
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.job_offer = @job_offer
    @job_application.user = current_user
    authorize @job_application
    if @job_application.save
      redirect_to job_applications_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_offer.update(job_application_params)
      redirect_to job_application_path(@job_application)
    else
      render :new
    end
  end

  def destroy
    if @job_application.destroy
      redirect_to job_applications_path
    else
      render :new
    end
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
    authorize @job_application
  end

  def set_job_offer
    @job_offer = JobOffer.find(params[:job_offer_id])
  end

  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :email, :motivation, :job_offer_id, :job_application_id)
  end
end
