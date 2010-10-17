module LinkHelper

#  def link_param

  def linkTo(text, url, title="")
   link_to text, url, :title => title
  end

  def link_to_new_tab(text,url, title="")
    link_to text, url, {:target => "_blank", :title => title}
  end

  def link_to_show(url)
    link_to image_tag("Globe.png", :border => 0), url, :title => "Show"
  end

  def link_to_edit(url)
    link_to image_tag("Edit.png", :border => 0), url, :title => "Edit"
  end

  def link_to_destroy(url)
    link_to image_tag("drop.png", :border => 0), url, :confirm => 'Are you sure?', :method => :delete, :title => "Destroy"
  end

  def link_to_new(url)
    link_to image_tag("Add.png", :border => 0), url, :title => "New"
  end

  def link_to_cancel(url)
    link_to image_tag("Add.png", :border => 0), url, :title => "cancel"
  end


end #end module LinkHelper
