class OrganisationsController < ApplicationController

  before_action :set_organisation, only: [:update, :destroy]

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

  def destroy
    @organisation.shifts.destroy_all
    @organisation.users.destroy_all
    @organisation.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
