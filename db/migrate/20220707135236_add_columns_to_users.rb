class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_reference :users, :organisation, foreign_key: true
  end
end
