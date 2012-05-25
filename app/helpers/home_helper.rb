module HomeHelper
  def api_methods_loop(api_data, api_methods_data)
    html_content = ""
    api_data.each do |api|
      html_content << "<div class='jq-portlet'><h5 class='apilist' id='api_#{api.id}'>#{api.name}#{image_tag '/images/arrow-down.png', :id=>'arrow' }</h5><div class='jq-pBody' style='display: none;'><ul>"
        api_methods_data.each do |method|
        if method.api_list_id == api.id
          html_content << "<li id='jq-n-Downloading-jQuery'>#{ link_to method.name, api_method_desc_path(method.id), :class=>"#{@api_method.id==method.id.to_s ? 'selected' : ''} method_def", :id=>'m_"+"#{method.id}'}</li>"
          end
      end
      html_content << "</ul></div></div>"
    end
    return html_content.html_safe
  end

  def home_error_codes(error_data)
    html_content = ""
    error_data.each do |type, errors|
      errors.each do |code, message|
        messages = message.split("%")
        html_content << "<tr><td>#{ code }</td>"
        html_content << "<td>#{ messages[0] }</td>"
        html_content << "<td>#{ messages[1] }</td></tr>"
      end
    end
    return html_content.html_safe
  end
end
