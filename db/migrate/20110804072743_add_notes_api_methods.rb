class AddNotesApiMethods < ActiveRecord::Migration
  def self.up
    add_column :api_methods, :notes, :text
  end

  def self.down
    remove_column :api_methods, :notes
  end
end
