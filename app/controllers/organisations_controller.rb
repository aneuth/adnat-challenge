class OrganisationsController < ApplicationController

  def create
    @organisation = Organisation.new(organisation_params)
    current_user.organisation = @organisation
    current_user.save
    @organisation.save
    redirect_to root_path
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to root_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
