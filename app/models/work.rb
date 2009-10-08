class Work < ActiveRecord::Base
  belongs_to :edition
  belongs_to :user
  belongs_to :contributor, :class_name => 'User', :foreign_key => :user_id
end
