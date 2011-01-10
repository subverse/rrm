module PresentationHelper
  
  def form(title, header_controls, footer_items, &block)

    html = ""

    html << "<div id='form-container'>"

    html << "<div id='form-header'>"
    html << "<div id='form-header-title'>"
    html << "<i>#{title}</i>"
    html << "</div>" #end form-header-title
    html << "<div id='form-header-controls'>"
    html << "<ul id='header-controls'>"
    if header_controls
      header_controls.each do |item|
        html << "<li>#{item}</li>"
      end
    end
    html << "</ul>"
    html << "</div>" #end form-header-controls
    html << "</div>" #end form-header
    html << "<div id='form-content'>"
    content = capture(&block)
    html << content
    html << "</div>" #end form-content
    
    if footer_items
      html << "<div id='form-footer'>"
      html << "<ul id='footer-items'>"
      footer_items.each do |item|
        html << "<li>#{item}</li>"
      end
      html << "</ul>"
      html << "</div>" #end form-footer
    end  
    html << "</div>" #end form-container
    
    concat(html)#, block)
  end #end form
  
  
end #end module PresentationHelper
