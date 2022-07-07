class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_up_path_for
    redirect_to welcome_path
  end
end
