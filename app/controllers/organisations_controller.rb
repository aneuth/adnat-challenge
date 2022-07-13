class OrganisationsController < ApplicationController

  def create
    @organisation = Organisation.new(params[:id])
    current_user.organisation = @organisation
    @organisation.save
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
