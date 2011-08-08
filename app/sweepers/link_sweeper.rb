class LinkSweeper < ActionController::Caching::Sweeper
  observe Link
 
  def after_create(link)
    expire_cache_for(link)
  end
 
  def after_update(link)
    expire_cache_for(link)
  end
 
  def after_destroy(link)
    expire_cache_for(link)
  end
 
  private
  def expire_cache_for(link)
    expire_page(:controller => 'links', :action => 'index')
  end
end