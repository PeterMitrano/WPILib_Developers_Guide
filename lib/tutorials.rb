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

  key = path.first
  val = path.first.split('.').first #strip file extension
  tree.add Tree::TreeNode.new(key,val)
 
  if (path.length() > 1)
    tree = tree[key]
    insert_tutorial(tree, item, path.drop(1))
  end

end

def tutorials(items)
  tree = Tree::TreeNode.new("/", "root")

  #parse into tree structure
  items.each do |item|
    if (item.path.include?('tutorials/'))
      insert_tutorial(tree, item, item.path.split('/').drop(2))
    end
  end

  tree.print_tree

  #generate the html
  return "<ul>#{generate_html(tree)}</ul>"
end

def generate_html(tree)
  html = ""
  tree.children.each do |node|
    if (node.is_leaf?)
      html += "<li><div class='tutorial tut'><a href='#{node.name}'>#{node.content}</a></div></li>"
    else
      children = generate_html(node)
      html +="<li><div class='tutorial category'><a href='#{node.name}'>#{node.content}</a></div><ul>#{children}</ul></li>"
    end
  end
  return html
end
