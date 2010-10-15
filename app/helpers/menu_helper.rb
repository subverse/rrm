# Methods added to this helper will be available to all templates in the application.
module MenuHelper

  def menu_item(item)
    html = ""
    html << "<li>"
    html << "#{item}"
    html << "</li>"
  end

  def menu(&menu_items)
    html = ""
    html << "<div id='Rahmen'>"
      html << "<ul id='Navigation'>"
        data = capture(&menu_items)
        html << data
      html << "</ul>"
    html << "<div></div></div>"
    concat(html, menu_items.binding)
  end

  def menu_L1(menu_items=nil)
    html = ""
    html << "<div id='Rahmen'>"
      html << "<ul id='Navigation'>"
      menu_items.each do |item|
        html << "<li>"
        html << "#{item}"
        html << "</li>"
      end
      html << "</ul>"
    html << "<div></div></div>"
  end

  def submenu_l1(menu_items=nil)
    html = ""
    html << "<ul>"
    menu_items.each do |item|
      html << "<li>"
        html << "#{item}"
      html << "</li>"
    end
    html << "</ul>"
  end

end #end module MenuHelper
