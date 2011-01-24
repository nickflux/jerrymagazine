class AddEpigraphToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :epigraph, :text
  end

  def self.down
    remove_column :works, :epigraph
  end
end
