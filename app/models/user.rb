require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  has_many :works
  default_scope order('lastname, firstname')
  
  has_friendly_id :lastname, :use_slug => true

  #validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40, :allow_blank => true
  validates_uniqueness_of   :login, :allow_blank => true
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message, :allow_blank => true

  validates_presence_of     :firstname
  validates_format_of       :firstname,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :firstname,     :maximum => 100
  
  validates_presence_of     :lastname
  validates_format_of       :lastname,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :lastname,     :maximum => 100

  #validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100, :allow_blank => true #r@a.wk
  validates_uniqueness_of   :email, :allow_blank => true
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message, :allow_blank => true

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  #attr_accessible :login, :email, :lastname, :firstname, :group, :password, :password_confirmation, :writer_type, :bio



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def get_fullname
    return "#{firstname} #{lastname}"
  end
  
  def get_edition_works(edition_id, work_type = nil)
    if work_type.blank?
      works.where(:edition_id => edition_id).order(:ordinal).all
    else
      works.where(:edition_id => edition_id, :work_type => work_type).order(:ordinal).all
    end
  end
  
  def bio_calc
    if bio_tt.blank?
      return white_list(bio).html_safe
    else
      return textilize(bio_tt).html_safe
    end
  end
  
  protected
    


end
