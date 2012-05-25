class CreateApiLists < ActiveRecord::Migration
  def self.up
    create_table :api_lists do |t|
      t.string :name
      t.boolean :status,:default=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :api_lists
  end
end
