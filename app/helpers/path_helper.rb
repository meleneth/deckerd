module PathHelper
  extend self

  def self.path_route_helper_function_name(*args)
    name      = Array.new
    arg_names = Array.new

    args.each do |arg|
      if arg.is_a? Class
        name << arg.table_name.singularize
        arg_names << arg.table_name.singularize
      end
      name << arg.to_s       if arg.is_a? Symbol
    end
    name << "path"
    return "#{name.join("_")}(#{arg_names.join(", ")})"
  end

  def self.path_route_helper_url(*args)
    name = Array.new
    name << ""
    args.each do |arg|
      if arg.is_a? Class
        name << arg.table_name 
        name << ":#{arg.table_name.singularize}_id"
      end
      name << arg.to_s       if arg.is_a? Symbol
    end
    return name.join("/")
  end

  def self.path_route_helper(*args)
    helper_body = []
    helper_body << "def #{ path_route_helper_function_name(*args) }";
    
    args.each do |arg|
      if arg.is_a? Class
        singular_name = arg.table_name.singularize
        helper_body << "  #{singular_name} = #{singular_name}.class == Symbol ? \":\" + #{singular_name}.to_s : #{singular_name}.id"
      end
    end

    name = Array.new
    name << ""
    args.each do |arg|
      if arg.is_a? Class
        name << arg.table_name 
        name << "\#{#{arg.table_name.singularize}}"
      end
      name << arg.to_s       if arg.is_a? Symbol
    end
    url = name.join("/")

    helper_body << ""
    helper_body << "  return \"#{url}\""
    helper_body << "end";

    module_eval helper_body.join "\n"
  end

  path_route_helper MagicProject, :add_deck, MagicDeck
  path_route_helper MagicProject, :remove_deck, MagicProjectDeck

end
  

