class ShiftsController < ApplicationController

  def index
    @shifts = current_user.organisation.shifts
  end
end
