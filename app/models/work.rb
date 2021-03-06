class Work < ActiveRecord::Base
  
  has_attached_file :attachment1, 
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'jerry-1pzrp75tx2ttjd1a7d02',
    :path => ":attachment/:id/:style/:filename"
    
  belongs_to  :edition
  belongs_to  :user
  belongs_to  :contributor, :class_name => 'User', :foreign_key => :user_id
  has_many    :work_pages, :dependent => :destroy
  accepts_nested_attributes_for :work_pages, :allow_destroy => true, :reject_if => proc { |attributes| attributes['page_number'].blank? }
  
  
  validates :title, :presence => true
  validates :title_tt, :presence => true
  validates :work_type, :presence => true
  
  has_friendly_id :title, :use_slug => true
  
  default_scope includes(:user, :edition)
  
  ###
  # INSTANCE METHODS
  #
  
  def title_calc
    if title_tt.blank?
      return white_list(title).html_safe
    else
      return textilize(title_tt).gsub!(/<p>|<\/p>/, "").html_safe
    end
  end
  
  def epigraph_calc
    if epigraph_tt.blank?
      return white_list(epigraph).html_safe
    else
      return textilize(epigraph_tt).html_safe
    end
  end
  
  def abstract_calc
    if abstract_tt.blank?
      return white_list(abstract).html_safe
    else
      return textilize(abstract_tt).html_safe
    end
  end
  
  def work_content_calc
    if work_content_tt.blank?
      return white_list(work_content).html_safe
    else
      return textilize(work_content_tt).html_safe
    end
  end
  
end
