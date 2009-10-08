class Edition < ActiveRecord::Base
  belongs_to  :user
  has_many    :works
  has_many    :contributors, :through => :works, :order => 'lastname', :uniq => true
  
  has_friendly_id :title, :use_slug => true
  
end
