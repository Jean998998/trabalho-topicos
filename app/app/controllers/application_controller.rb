class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

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

  private

  def require_logged_in_user
    unless user_signed_in?
      flash[:danger] = 'Para acessar faça login!'
      redirect_to entrar_path
    end
  end
end