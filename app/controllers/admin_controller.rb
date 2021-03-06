class AdminController < ApplicationController
  
  uses_tiny_mce :only => [:new, :create, :edit, :update],
    :options => {:theme => 'advanced',
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_resizing => true,
    :theme_advanced_resize_horizontal => false,
    :theme_advanced_buttons1 => %w{formatselect styleselect bold italic underline justifyleft justifycenter justifyright bullist numlist separator link unlink code indent outdent},
    :theme_advanced_buttons2 => [],
    :theme_advanced_buttons3 => [],
    :extended_valid_elements => "a[name|href|target|title|onclick]",
    :theme_advanced_styles => "First Line Indent=first_line_indent"
  }
  
  before_filter :login_required

  def index
    
  end
end