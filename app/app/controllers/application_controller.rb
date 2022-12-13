class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, :only => :create
  protect_from_forgery with: :null_session
  before_action :set_locale
  helper_method :current_user
  helper_method :logged_in?

  helper_method :authenticate_adm?
  def authenticate_adm?
    current_user&.is_admin
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end

  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end
  end
end
