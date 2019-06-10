class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :make_company_dispo
  before_action :make_job_offers_dispo
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :photo])
  end

  # Pundit: authorization management
  include Pundit
  after_action :verify_authorized, except: [:index, :my_job_offers], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :my_job_offers], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def make_company_dispo
    @companies ||= Company.all
  end

  def make_job_offers_dispo
    @my_job_offers ||= JobOffer.joins(:company).where(companies: {user_id: current_user}).where('start_date > ?', DateTime.now)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
