class AddImagesLightboxToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :images_lightbox, :boolean
  end

  def self.down
    remove_column :works, :images_lightbox
  end
end