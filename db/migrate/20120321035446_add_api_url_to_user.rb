class AddApiUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :api_url, :string
  end

  def self.down
    remove_colunm :users, :api_url
  end
end
