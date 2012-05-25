class CreateApiMethods < ActiveRecord::Migration
  def self.up
    create_table :api_methods do |t|
      t.integer :api_list_id
      t.string :name
      t.text :description
      t.string :resource_url
      t.string :verb
      t.string :request_url
      t.text :success_response
      t.text :error_response
      t.timestamps
    end
  end

  def self.down
    drop_table :api_methods
  end
end
