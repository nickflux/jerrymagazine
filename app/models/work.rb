class Work < ActiveRecord::Base
  
  belongs_to :edition
  belongs_to :user
  belongs_to :contributor, :class_name => 'User', :foreign_key => :user_id
  
  has_friendly_id :title, :use_slug => true
  
  default_scope :order => 'title'
  
end
