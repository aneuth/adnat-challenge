class AddPriorShiftColumnToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :prior_shift, :boolean, default: false
  end
end
