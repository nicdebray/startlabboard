class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = policy_scope(Company)
  end

  def show
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    authorize @company
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path
    else
      render :new
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :description, :website, :address, :photo)
  end

end
