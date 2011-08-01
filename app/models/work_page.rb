class WorkPage < ActiveRecord::Base
  
  has_attached_file :work_image, 
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'jerry-1pzrp75tx2ttjd1a7d02',
    :path => ":attachment/:id/:style/:filename"
  
  belongs_to :work
  default_scope :order => 'page_number'
  
  def page_content_calc
    return textilize(page_content).html_safe
  end
  
end
