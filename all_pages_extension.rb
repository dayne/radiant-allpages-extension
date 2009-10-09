# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class AllPagesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/all_pages"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :all_pages
  #   end
  # end
  
  def activate
    # admin.nav[:content] << admin.nav_item(:all_pages, "All Pages", "/admin/all_pages"), :after => :pages
  end
end
