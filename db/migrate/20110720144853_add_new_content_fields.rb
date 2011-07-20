class AddNewContentFields < ActiveRecord::Migration
  def self.up
    add_column :users, :bio_tt, :text, :default => nil
    add_column :users, :old_style, :boolean, :default => false
    add_column :works, :abstract_tt, :text, :default => nil
    add_column :works, :title_tt, :string, :default => nil
    add_column :works, :work_content_tt, :text, :default => nil
    add_column :works, :epigraph_tt, :text, :default => nil
    add_column :works, :old_style, :boolean, :default => false
    Work.all.each{|w| w.update_attributes(:old_style => true)}
    User.all.each{|w| w.update_attributes(:old_style => true)}
  end

  def self.down
    remove_column :works, :old_style
    remove_column :works, :epigraph_tt
    remove_column :works, :work_content_tt
    remove_column :works, :title_tt
    remove_column :works, :abstract_tt
    remove_column :users, :old_style
    remove_column :users, :bio_tt
  end
end