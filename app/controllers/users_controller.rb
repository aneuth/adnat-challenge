class UsersController < ApplicationController

  def join_organisation
    @organisation = Organisation.find(params[:organisation_id])
    current_user.organisation = @organisation
    current_user.save
    redirect_to root_path
  end
end
