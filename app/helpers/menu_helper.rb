module MenuHelper
  
  
  def menu(&menu_items_block) # menu item(s) or submenu(s)
    html = ""
    html << "<div class='menu'>"
      html << "<ul>"
        menu_items = capture(&menu_items_block)
        html << menu_items
      html << "</ul>"
    html << "</div>"
    concat(html, menu_items_block)
  end #end menu


  def menu_item(text, dest, title="")
    html = ""
    html << "<li>"
    html << "#{link(text, dest, title)}"
    html << "</li>"
  end #end menu_item


  def menu_item_to_new_tab(text, dest, title="")
    html = ""
    html << "<li>"
    html << "#{links_to_new_tab(text, dest, title)}"
    html << "</li>"
  end #end menu_item


  def submenu(title, &submenu_items_block)
    html = ""
    html << "<li>"
      html << "<p>#{title}</p>"
      html << "<ul>"
        submenu_items = capture(&submenu_items_block)
        html << submenu_items
      html << "</ul>"
    html << "</li>"
    concat(html, submenu_items_block)
  end #end submenu


  def submenu_bak(text, dest, title="", &submenu_items_block)
    html = ""
    html << "<li>"
      html << "#{link(text, dest, title)}"
      html << "<ul>"
        submenu_items = capture(&submenu_items_block)
        html << submenu_items
      html << "</ul>"
    html << "</li>"
    concat(html, submenu_items_block)
  end #end submenu


  def submenu_item(item)
    html = ""
    html << "<li>"
      html << "#{item}"
    html << "</li>"
  end #end submenu_item(item)


  private


  def link(text, dest, title)
    link_to text, dest, {:class => 'hidden', :title => title}
  end


  def links_to_new_tab(text, dest, title)
    link_to text, dest, {:class => 'hidden', :target => '_blank', :title => title}
  end


end #end module MenuHelper
