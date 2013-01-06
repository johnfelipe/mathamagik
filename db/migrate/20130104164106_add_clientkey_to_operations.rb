class AddClientkeyToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :clientkey, :integer
    add_column :operations, :createtime, :date
  end
end
