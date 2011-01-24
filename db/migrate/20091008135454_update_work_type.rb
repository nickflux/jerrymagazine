class UpdateWorkType < ActiveRecord::Migration
  def self.up
    rename_column :works, :type, :work_type
  end

  def self.down
    rename_column :works, :work_type, :type
  end
end
