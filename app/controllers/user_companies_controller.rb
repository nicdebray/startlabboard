# frozen_string_literal: true

class UserCompaniesController < ApplicationController
  before_action :set_company, only: %i[index new edit]

  def index
    @user_companies = current_user.user_companies.all
  end

  def show; end

  def new
    @user_company = Usercompany.new
  end

  def create
    @user_company = Usercompany.new(user_companies_params)
    @user_company.user_id = current_user.id
    if @user_company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user_company.update(user_companies_params)
      redirect_to companies
    else
      render :new
    end
  end

  def destroy
    if @user_company.destroy
      redirect_to companies
    else
      render :new
    end
  end

  private

  def user_companies_params
    params.require(:user_company).permit(:user_id, :company_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
