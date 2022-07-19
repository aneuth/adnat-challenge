class AddShiftDateColumnToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :shift_date, :date
  end
end
