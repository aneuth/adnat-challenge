class ChangeShiftsStartAndFinishColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :shifts, :start, :time
    change_column :shifts, :finish, :time
  end
end
