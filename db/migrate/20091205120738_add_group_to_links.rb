class AddGroupToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :group, :string
  end

  def self.down
    remove_column :links, :group
  end
end
