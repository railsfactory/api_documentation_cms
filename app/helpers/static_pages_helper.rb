module StaticPagesHelper
  def static_page_lists(data)
    html_content = ""
    data.each do |static_page|
      html_content << "<td>#{ static_page.name }</td>"
      html_content << "<td>#{ raw static_page.description }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Show', static_page }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Edit', edit_static_page_path(static_page) }</td>"
      html_content << "<td width='50px' style='font-size:12px;'>#{ link_to 'Destroy', static_page, :confirm => 'Are you sure?', :method => :delete }</td>"
    end
    return html_content
  end
end
