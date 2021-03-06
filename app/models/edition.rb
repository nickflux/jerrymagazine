class Edition < ActiveRecord::Base
  belongs_to  :user
  has_many    :works
  has_many    :contributors, :through => :works, :order => 'lastname', :uniq => true
  
  validates :title, :presence => true
  validates :edition_no, :numericality => true
  
  has_friendly_id :title, :use_slug => true
  
  def contributors_content_calc
    return textilize(contributors_content).html_safe unless contributors_content.blank?
  end
  
  def description_calc
    return textilize(description).html_safe
  end
  
end
