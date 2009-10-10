# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class AllPagesExtension < Radiant::Extension
  version "1.0"
  description "A simple extension to add r:all_pages radius tag"
  url "http://github.com/dayne/radiant-all_pages-extension"
  
  def activate
    Page.class_eval { include AllPagesTags }
  end
end
