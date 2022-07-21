class UsersController < ApplicationController

  def join_organisation
    @organisation = Organisation.find(params[:organisation_id])
    current_user.organisation = @organisation
    current_user.save
    redirect_to root_path
  end

  def leave_organisation
    @organisation = Organisation.find(params[:organisation_id])
    @user_shifts = current_user.shifts.select { |shift| shift.organisation.id = current_user.organisation.id }
    @user_shifts.each do |shift|
      shift.prior_shift!
      shift.save
    end
    @organisation.users.delete(current_user)
    redirect_to root_path
  end

  def my_profile
    redirect_to root_path unless current_user
  end

end
