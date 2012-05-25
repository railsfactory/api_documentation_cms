module ParametersHelper
  def parameter_lists(data)
    html_content = ""
    data.each do |parameter|
      html_content << "<tr><td>#{parameter.api_method_id}</td>"
      html_content << "<td>#{ parameter.name }</td>"
      html_content << "<td>#{ parameter.description }</td>"
      html_content << "<td>#{ parameter.validation }</td>"
      html_content << "<td>#{ parameter.is_request }</td>"
      html_content << "<td>#{ link_to 'Show', parameter }</td>"
      html_content << "<td>#{ link_to 'Edit', edit_parameter_path(parameter) }</td>"
      html_content << "<td>#{ link_to 'Destroy', parameter, :confirm => 'Are you sure?', :method => :delete }</td></tr>"
    end
    return html_content
  end
end
