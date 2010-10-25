# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def  add_to_list(recipe)
    if current_user != nil
      link_to image_tag("Paste_16x16.png", :border=>0), {:controller => "lists", :action => "new",
        :params => {:recipe_id => recipe.id }}
    end
  end # end add_to_list


  def  remote_add_to_list(recipe, div)
    if current_user != nil
      link_to_remote image_tag("Paste_16x16.png", :border=>0), :url => {:controller => "lists", :action => "new",
                                                                 :params => {:recipe_id => recipe.id}},
                                                        :update => { :success => div, :failure => div},
                                                        :before => "$('#{div}').update('Laden...')"
    end
  end # end remote_add_to_list


  def admin?
    session[:admin] == true
  end

  def user?
    admin? or not session[:user_id] == nil
  end

  #Operationen auf Datensatz

  def img_link_to_show(data)
    link_to image_tag("info.png", :border=>0), data, :title => "Details anzeigen"
  end

  def img_link_to_edit(path)
    link_to image_tag("edit.png", :border=>0), path,{:class => "link_ext" }
  end

  def img_link_to_drop(data)
    link_to image_tag("drop.png", :border=>0), data, :confirm => "Delete #{data.name}", :method => :delete
  end # my_link_to_drop


  #--------used_for_internal_linking--------------------------------------------------------

  def my_link_to(title,controller,action,id)
    link_to title, {:controller => controller, :action => action, :id => id}, {:class => "link_ext"}
  end

  def my_link_to_path(title, path)
    link_to title, path, {:class => "link_ext" }
  end


  def link_to_new_tab(txt,url)
    link_to txt, url, {:target => "_blank", :class=>"link_ext"}
  end


  #------extern_weblinks--------------------------------------------------------------------

  def my_link_to_ext(txt,url)
    link_to txt, url, {:target => "_blank", :class=>"link_ext"}
  end


end
