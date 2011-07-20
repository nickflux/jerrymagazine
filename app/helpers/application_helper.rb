module ApplicationHelper
  
  WhiteListHelper.attributes.merge %w(style)
  
  # display text using Textile
  def textilize(text)  
    text  = swear_generator(text)
    RedCloth.new(text).to_html.html_safe unless text.blank?  
  end
  
end
