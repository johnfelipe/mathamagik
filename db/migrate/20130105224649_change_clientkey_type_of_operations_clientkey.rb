class ChangeClientkeyTypeOfOperationsClientkey < ActiveRecord::Migration
  def up
  	change_table :operations do |t|
  		t.remove :clientkey
  	end
  	add_column :operations, :cookie, :string
  end

  def down
  end
end
