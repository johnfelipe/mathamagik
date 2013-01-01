class CreateOperations < ActiveRecord::Migration
	serialize: top
	
  def change
    create_table :operations do |t|
      t.text :top
      t.text :bottom

      t.timestamps
    end
  end
end
