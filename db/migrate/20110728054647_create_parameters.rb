class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.integer :api_method_id
      t.string :name
      t.text :description
      t.text :validation
      t.boolean :is_request
      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
