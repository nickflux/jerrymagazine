module ApplicationHelper
  
  WhiteListHelper.attributes.merge %w(style)
  
  # display text using Textile
  def textilize(text, no_p = false)
    RedCloth.new(text).to_html.html_safe unless text.blank?
  end
  
  def no_paragraph(text)
    text.gsub(/<p>|<\/p>/, "").html_safe
  end
  
  
  ### FORM HELPERS
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new

    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(:partial => association.to_s.singularize + "_fields", :locals => { :wp => builder})
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end
  
end
