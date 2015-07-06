require 'pp'
require 'tree'

#insert item in the tree
def insert_tutorial(tree, item, path)

  tree.children.each do |child|
    if (child.name == path.first())
      new_path = path.drop(1)
      insert_tutorial(child, item, new_path)
      return;
    end
  end

  #it's not in the tree, so add it
  #if we've reached the file, add the title as content
  content = "directory"
  if (path.length() == 1)
    if (item[:category] != nil)
      content = item[:category]
    elsif (item[:path] != nil)
      content = item[:title]
    end
    tree.add Tree::TreeNode.new(path.first(), content)
  else
    tree.add Tree::TreeNode.new(path.first(), content)
    tree = tree[path.first()]
    insert_tutorial(tree, item, path.drop(1))
  end

end

def tutorials(items)
  tree = Tree::TreeNode.new("/", "root")
  items.each do |item|
    if (item.path != '/')
      insert_tutorial(tree, item, item.path.split('/').drop(1))
    end
  end

  tree.print_tree  
  puts '-----------------'
  #generate the html
=begin  
  tutorials="<ul>"
  begun_categories = false
  tuts.each do |tut|
    if (tut[:category] != nil)
      if (begun_categories)
        tutorials += "</ul>\n</li>\n"
      end
      tutorials += "<li><div class='tutorial category'><a href='#{tut.path}'>#{tut[:category]}</a></div>\n"
      tutorials += "<ul>"
      begun_categories = true
    else
      tutorials += "<li class='tutorial tut'><a href='#{tut.path}'>#{tut[:title]}</a></li>\n"
    end
  end
  tutorials += "</ul>\n</li>\n</ul>\n"
  return tutorials
=end
end

def list_tutorials(items)
  tuts = get_sorted_tutorials(items)
  list = ""
  tuts.each do |tut|
    if (tut.path.include?('tutorials'))
      list << "'#{tut.path}',"
    end
  end
  return list
end

def get_sorted_tutorials(items)
  #sort tut alphabetically first
  raw_list = []
  items.each do |tut|
    if (tut.path.include?("tutorials/"))
      raw_list << tut
    end
  end
  raw_list.sort_by!{ |tut| tut.path.downcase}

  #organize in nested structure
  tuts = organize(raw_list)
end

#append to tuts the tutorials in a nested fashion
def organize(raw_list)
  tuts = []
  raw_list.each_with_index do |tut,i|
    if (tut[:category] != nil)
      #add children
      rest = raw_list.drop(i + 1)
      children = organize(rest)
      raw_list -= children
      #add category
      #tuts << {category: tut, children: children }
      tuts << {category: tut, children: "to be determined..."}
    else
      tuts << {item: tut}
    end
  end
  return tuts
end
