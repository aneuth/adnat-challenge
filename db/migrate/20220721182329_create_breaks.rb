class CreateBreaks < ActiveRecord::Migration[7.0]
  def change
    create_table :breaks do |t|
      t.integer :break_length
      t.timestamps
    end
  end
end
