class UsercompaniesController < ApplicationController
  before_action :set_company, only: [:index, :new, :edit]

  def index
    @usercompanies = current_user.usercompanies.all
  end

  def show
  end

  def new
    @usercompany = Usercompany.new
  end

  def create
    @usercompany = Usercompany.new(usercompanies_params)
    @usercompany.user_id = current_user.id
    if @usercompany.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @usercompany.update(usercompanies_params)
      redirect_to companies
    else
      render :new
    end
  end

  def destroy
    if @usercompany.destroy
      redirect_to companies
    else
      render :new
    end
  end

  private

  def usercompanies_params
    params.require(:usercompany).permit(:user_id, :company_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
