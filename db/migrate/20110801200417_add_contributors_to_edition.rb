class AddContributorsToEdition < ActiveRecord::Migration
  def self.up
    add_column :editions, :contributors_content, :text
  end

  def self.down
    remove_column :editions, :contributors_content
  end
end