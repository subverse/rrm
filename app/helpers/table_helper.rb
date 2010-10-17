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


       def table_row(obj, edit_path, alternating, access, show, edit, destroy, obj_values)
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
         html << "#{table_row_ops obj, edit_path, access, show, edit, destroy}"
         html << "</tr>"
       end #end table_row


       def table_row_ops(obj, edit_path, access, show, edit, destroy)
         html = ""
         html << "<td class='td1'>#{link_to_show obj}</td>" if show
         if access
           html << "<td class='td1'>#{link_to_edit edit_path}</td>" if edit
           html << "<td class='td1'>#{link_to_destroy obj}</td>" if destroy
         end
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
