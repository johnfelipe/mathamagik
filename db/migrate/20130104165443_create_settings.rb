class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :sequence

      t.timestamps
    end
  end
end
