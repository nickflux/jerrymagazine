class Work < ActiveRecord::Base
  
  has_attached_file :attachment1, 
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :bucket => 'jerry-1pzrp75tx2ttjd1a7d02',
    :path => ":attachment/:id/:style/:filename"

  belongs_to :edition
  belongs_to :user
  belongs_to :contributor, :class_name => 'User', :foreign_key => :user_id
  
  has_friendly_id :title, :use_slug => true
  
  default_scope :order => 'title'
  
end
