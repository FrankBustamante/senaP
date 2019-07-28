class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  private
  def user_not_authorized
    redirect_to root_path
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
