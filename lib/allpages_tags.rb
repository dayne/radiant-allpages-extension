module AllpagesTags
  include Radiant::Taggable

  tag 'allpages' do |tag|
    tag.expand
  end

  desc %{
    Usage:
    <pre><code><r:allpages [offset="number"] [limit="number"]
    [by="published_at|updated_at|created_at|slug|title|keywords|description"]
    [order="asc|desc"] [status="draft|reviewed|published|hidden|all"/></code></pre>
    Gives you all your pages back in a for loop
  }
  tag 'allpages:each' do |tag|
    options = children_find_options(tag)
    result = []
    allpages = Page.find(:all, options)
    allpages.each_with_index do |item, i|
      tag.locals.page = item
      result << tag.expand
    end
    result
  end

  desc %{
    count of all the pages you have in the system? 
  }
  tag 'allpages:count' do |tag|
  end
end
