def tutorials(items)
  #sort item alphabetically first
  list = []
  items.each do |item|
    list << item
  end
  list.sort_by!{ |item| item.path.downcase}
  #generate the html
  tutorials="<ul>"
  begun_categories = false
  list.each do |item|
    if (item.path.include?("tutorials/"))
      if (item[:category] != nil)
        if (begun_categories)
          tutorials += "</ul></il>"
        end
        tutorials += "<li><div class='tutorial category'><a href='#{item.path}'>#{item[:category]}</a></div>"
        tutorials += "<ul>"
        begun_categories = true
      else
        tutorials += "<li class='tutorial item'><a href='#{item.path}'>#{item[:title]}</a></li>"
      end
    end
  end
  tutorials += "</ul>"
  return tutorials
end
