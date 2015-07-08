include Nanoc::Helpers::LinkTo

# generate html menu for default layout
def generate_menu(current_path)
  items = [
    {
      href: '',
      title: 'Homepage'
    },
    {
      href: 'tutorials',
      title: 'Tutorials'
    },
    {
      href: 'contributing',
      title: 'Contributing'
    },
    {
      href: 'bugs',
      title: 'Bugs'
    }
  ]

  html = ""
  items.each do |item|
    href = mangle_href(item[:href])
    classname = ""
    if (current_path == href)
      classname = "current_page_item"
    end
    link_path = relative_path_to(href)
    link = link_to(item[:title],link_path)
    html += "<li class='#{classname}'>#{link}</li>"
  end

  return html
end

def mangle_href(href)
  if (href == '')
    return '/'
  end
  return "/" + href + ".html"
end

def include_search_box(current_path)
  search = relative_path_to("/search.html")
  puts search
  search_box = "<div id='searchbox'>"
  search_box += "<form action='#{search}'>"
  search_box += "<input type='text' id='search_input' placeholder='EX: FRCSim'>"
  search_box += "<button id='search_button' > <i class='fa fa-search'></i> </button>"
  search_box += "</form>"
  search_box += "</div>"
  unless (current_path.include?("search"))
      return search_box
  end
end
