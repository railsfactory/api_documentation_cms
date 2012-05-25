module ApiMethodsHelper
  def method_lists(data)
    html_content = ""
    data.each do |method|
      html_content << "<tr>"
      html_content << "<td width='180px' style='font-size:16px;'>#{ method.name }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Show', method }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Edit', edit_api_method_path(method) }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Destroy', apimethod_destroy_path(method.id), :confirm => 'Are you sure?', :method => :delete }</td></tr>"
    end
    return html_content.html_safe
  end

  def api_method_show(api_data, api_methods_data)
    html_content = ""
    api_data.each do |api|
      html_content << "<div class='jq-portlet'><h5 class='apilist' id='api_#{api.id}' style='cursor:pointer;'>#{api.name}#{image_tag '/images/arrow-down.png', :id=>'arrow' }</h5><div class='jq-pBody' style='display: none;'><ul>"
      api_methods_data.each do |method|
        if method.api_list_id == api.id
          html_content << "<li id='jq-n-Downloading-jQuery'>#{ link_to_api_method(method) }</li>"
        end
      end
      html_content << "</ul></div></div>"
    end
    return html_content.html_safe
  end

  def api_method_params(data)
    html_content = ""
    data.parameters.each do |f|
      html_content << "<tr><td style='font-size:14px;'>#{ f.name }</td>"
      html_content << "<td style='font-size:14px;'>#{ f.description }</td>"
      html_content << "<td style='font-size:14px;'>#{ f.validation }</td>"
      html_content << "<td style='font-size:14px;'>#{ f.is_request }</td></tr>"
    end
    return html_content.html_safe
  end
end
