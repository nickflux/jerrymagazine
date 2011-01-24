class AddAttachmentsAttachment1ToWork < ActiveRecord::Migration
  def self.up
    add_column :works, :attachment1_file_name, :string
    add_column :works, :attachment1_content_type, :string
    add_column :works, :attachment1_file_size, :integer
    add_column :works, :attachment1_updated_at, :datetime
  end

  def self.down
    remove_column :works, :attachment1_file_name
    remove_column :works, :attachment1_content_type
    remove_column :works, :attachment1_file_size
    remove_column :works, :attachment1_updated_at
  end
end
