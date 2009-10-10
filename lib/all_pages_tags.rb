module AllPagesTags
  include Radiant::Taggable

  desc %{
    Usage:
    <pre><code><r:all_pages [offset="number"] [limit="number"]
    [by="published_at|updated_at|created_at|slug|title|keywords|description"]
    [order="asc|desc"] [status="draft|reviewed|published|hidden|all"/></code></pre>
    Gives you all your pages back in a for loop
  }
  tag 'all_pages:each' do |tag|
    options = children_find_options(tag)
    result = []
    all_pages = Page.find(:all, options)
    all.each_with_index do |item, i|
      tag.locals.page = item
      result << tag.expand
    end
    result
  end

  desc %{
    count of all the pages you have in the system? 
  }
  tag 'all_pages:count' do |tag|
  end
end
