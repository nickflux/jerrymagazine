class RemoveUserLoginIndex < ActiveRecord::Migration
  def self.up
    remove_index :users, :login
  end

  def self.down
    add_index :users, :login, :unique => true
  end
end
