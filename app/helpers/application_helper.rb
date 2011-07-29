module ApplicationHelper
  
  WhiteListHelper.attributes.merge %w(style)
  
  # display text using Textile
  def textilize(text, no_p = false)
    RedCloth.new(text).to_html.html_safe unless text.blank?
  end
  
  def no_paragraph(text)
    text.gsub(/<p>|<\/p>/, "").html_safe
  end
  
end
