class AddNumdigitsToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :numdigits, :integer
  end
end
