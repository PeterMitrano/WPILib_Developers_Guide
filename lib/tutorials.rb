def tutorials(items)
  tutorials=""
  begun_categories = false
  items.each do |item|
    if (item.path.include?("tutorials/"))
      if (item[:category] != nil)
        if (begun_categories)
          tutorials += "</ul>"
        end
        tutorials += "<ul>"
        tutorials += "<div class='tutorial category'><li><a href='#{item.path}'>#{item[:category]}</a></li></div>"
        begun_categories = true
      else
        tutorials += "<li class='tutorial item'><a href='#{item.path}'>#{item[:title]}</a></li>"
      end
    end
  end
  return tutorials
end
