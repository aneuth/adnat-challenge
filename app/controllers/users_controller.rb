class UsersController < ApplicationController

  def join_organisation
    @organisation = Organisation.find(params[:organisation_id])
    current_user.organisation = @organisation
    current_user.save
    redirect_to root_path
  end

  def leave_organisation
    current_user.organisation = nil
    current_user.save
    redirect_to root_path
  end

  def my_profile
    redirect_to root_path unless current_user
  end
end
