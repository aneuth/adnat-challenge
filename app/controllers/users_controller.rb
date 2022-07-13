class UsersController < ApplicationController

  def join_organisation
    @organisation = Organisation.find(params[:id])
    current_user.organisation = @organisation
    current_user.update
  end
end
