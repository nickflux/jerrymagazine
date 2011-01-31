class AddOrdinalToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :ordinal, :integer, :default => 0
  end

  def self.down
    remove_column :works, :ordinal
  end
end