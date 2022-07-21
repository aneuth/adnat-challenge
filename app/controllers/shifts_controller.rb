class ShiftsController < ApplicationController
  before_action :set_params, only: [:create, :update]

  def index
    @shifts = current_user.organisation.shifts.order(start: :desc)
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user = current_user
    @shift.save
    redirect_to shifts_path
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.update(shift_params)
    redirect_to shifts_path
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path, status: :see_other
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length)
  end

  def set_params
    params[:shift].merge!({
      'finish(1i)': params[:shift]['start(1i)'],
      'finish(2i)': params[:shift]['start(2i)'],
      'finish(3i)': params[:shift]['start(3i)']
    })
  end
end
