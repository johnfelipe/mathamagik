class AddOptypeToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :optype, :integer
  end
end
