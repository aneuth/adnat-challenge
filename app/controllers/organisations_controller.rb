class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:edit, :update]

  def edit
  end

  def update
    @organisation.update(organisation_params)
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

end
