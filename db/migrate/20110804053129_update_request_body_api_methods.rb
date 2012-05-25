class UpdateRequestBodyApiMethods < ActiveRecord::Migration
  def self.up
    add_column :api_methods, :request_body, :text
  end

  def self.down
    remove_column :api_methods, :request_body
  end
end
