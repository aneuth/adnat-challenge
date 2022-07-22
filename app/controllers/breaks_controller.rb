class BreaksController < ApplicationController

  def create
    @break = Break.new(break_params)
    @break.save
    current_user.shifts.each do |shift|
      shift.breaks << @break
    end
    redirect_to shifts_path
  end

  private

  def break_params
    params.require(:break).permit(:break_length)
  end

end
