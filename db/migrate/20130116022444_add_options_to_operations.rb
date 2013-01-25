class AddOptionsToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :options, :integer
  end
end
