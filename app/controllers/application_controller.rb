class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :pages_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_or_admin_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def admin_controller?
    controller_path.start_with?('admin/')
  end

  def devise_or_pages_or_admin_controller?
    devise_controller? || pages_controller? || admin_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:alert] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:email, :first_name, :last_name, :birthday_month, :birthday_day, :birthday_year, :description, :phone_number, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :first_name, :last_name, :birthday_month, :birthday_day, :birthday_year, :description, :phone_number, :password, :password_confirmation, :current_password, :picture) }
  end

end
