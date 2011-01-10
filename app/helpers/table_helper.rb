# Methods added to this helper will be available to all templates in the application.
module TableHelper


       def table_header(cols)
         # expects column header names in array e.g. ["value1", "value2", ..., "value3"]
         html = ""
         if cols.length > 0
           html << "<tr>"
           cols.each do |col|
             html << "<th>#{col}</th>"
           end
           html << "</tr>"
         end
       end #end table_header


       def table_cell(content)
         html = ""
         html << "<td>#{content}</td>"
       end #end table_cell(content)



       def table_row(obj, edit_path, alternating, show, edit, destroy, remote_edit=false, &block)
         # expects cell value and the object which contains these value
         html = ""
         if alternating
           html << "<tr class='#{cycle('odd', 'even')}'>"
         else
           html << "<tr>"
         end
         cell_values = capture(&block)
         html << cell_values
         html << "#{table_row_ops obj, edit_path, show, edit, destroy, remote_edit}"
         html << "</tr>"
         concat(html, block)
       end #end table_row


       def table_row_bak(obj, edit_path, alternating, show, edit, destroy, obj_values)
         # expects cell value and the object which contains these value
         html = ""
         if alternating
           html << "<tr class='#{cycle('odd', 'even')}'>"
         else
           html << "<tr>"
         end
         obj_values.each do |value|
           html << "<td>#{value}</td>"
         end
         html << "#{table_row_ops obj, edit_path, show, edit, destroy}"
         html << "</tr>"
       end #end table_row


       def table_row_ops(obj, edit_path, show, edit, destroy, remote_edit)
         html = ""
         html << "<td class='td1'>#{link_to_show obj}</td>" if show
         if not remote_edit
           html << "<td class='td1'>#{link_to_edit edit_path}</td>" if edit
         else  
           html << "<td class='td1'>#{imageLinkToRemote 'Edit_16x16.png', edit_path, 'erg'}</td>" if edit
         end  
         html << "<td class='td1'>#{link_to_destroy obj}</td>" if destroy
         html
       end #end table_row_ops


       def table(header, &block)
         html = ""
         html << "<table>"
         html << "#{table_header(header)}"
         data = capture(&block)
         html << data
         html << "</table>"
         concat(html, block.binding)
       end


end #end module ApplicationHelper
