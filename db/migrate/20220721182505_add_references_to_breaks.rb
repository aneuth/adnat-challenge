class AddReferencesToBreaks < ActiveRecord::Migration[7.0]
  def change
    add_reference :breaks, :shift, foreign_key: true
  end
end
