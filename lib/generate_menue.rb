# generate html menu for default layout
# should look like this in the end  
#  <li class="current_page_item"><a href="/" accesskey="1" title="">Homepage</a></li>
#  <li><a href="/tutorials.html" accesskey="1" title="">Tutorials</a></li>
#  <li><a href="/contributing.html" accesskey="2" title="">Contributing</a></li>
#  <li><a href="/bugs.html" accesskey="3" title="">Bugs</a></li>
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
    html += "<li class='#{classname}'><a href='#{href}'>#{item[:title]}</a></li>"
  end

  return html
end

def mangle_href(href)
  if (href == '')
    return '/'
  end
  return "/" + href + ".html"
end
