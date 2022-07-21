class RemoveBreakLengthFromShifts < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :break_length
  end
end
