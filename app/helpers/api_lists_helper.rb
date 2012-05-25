module ApiListsHelper
  def list_content(data)
    html_content = ""
    data.each do |x|
      html_content << "<tr><td style='font-size:14px; text-align: left;' width='150px'>#{x.name}</td>"
      html_content << "<td width='150px' style='font-size:14px;'><a href='api/#{x.id}'>Add Methods</td>"
      html_content << "<td width='150px' style='font-size:14px;'><a href='apimethods/#{x.id}'>Edit Methods</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{link_to 'Show', x}</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{link_to 'Edit', edit_api_list_path(x)}</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{link_to 'Destroy', api_destroy_path(x.id), :confirm => 'Are you sure?', :method => :delete }</td></tr>"
    end
    return html_content.html_safe
  end

  def list_errors(data)
    error_content = ""
    data.errors.full_messages.each do |msg|
      error_content << "<li>#{msg}</li>"
    end
    return error_content.html_safe
  end
end
