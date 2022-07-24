class BreaksController < ApplicationController

  def create
    @break = Break.new(break_params)
    @shift = Shift.find(params[:shift_id])
    @break.shift = @shift
    @break.user = current_user
    @break.save
    @shift.breaks << @break
    redirect_to shifts_path
  end

  private

  def break_params
    params.require(:break).permit(:break_length)
  end

end
