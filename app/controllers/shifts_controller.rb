class ShiftsController < ApplicationController
  before_action :set_params, only: [:create, :update]
  before_action :set_shift, only: [:update, :destroy, :add_prior_shift]

  def index
    @organisation = current_user.organisation
    @shifts = @organisation.shifts.order(start: :desc)
    @shift = Shift.new
    @shift.breaks.build
  end

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @shift = Shift.new(shift_params)
    @shift.organisation = @organisation
    @shift.user = current_user
    @shift.save
    redirect_to shifts_path
  end

  def update
    @shift.update(shift_params)
    redirect_to shifts_path
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path, status: :see_other
  end

  def view_prior
    @shifts = []
    current_user.shifts.each do |shift|
      if shift.organisation == current_user.organisation
        @shifts << shift
      end
    end
  end

  def add_prior_shift
    @shift.prior_shift = false
    @shift.save
    redirect_to shifts_path, notice: "Shift added to current shifts"
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_id)
  end

  def set_params
    params[:shift].merge!({
      'finish(1i)': params[:shift]['start(1i)'],
      'finish(2i)': params[:shift]['start(2i)'],
      'finish(3i)': params[:shift]['start(3i)']
    })
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
