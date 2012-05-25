class AddPosition < ActiveRecord::Migration
  def self.up
    add_column :api_lists, :position, :integer
    add_column :api_methods, :position, :integer
    add_column :parameters, :position, :integer
  end

  def self.down
    remove_column :api_lists, :position
    remove_column :api_methods, :position
    remove_column :parameters, :position
  end
end
