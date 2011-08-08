class EditionSweeper < ActionController::Caching::Sweeper
  observe Edition
 
  def after_create(edition)
    expire_cache_for(edition)
  end
 
  def after_update(edition)
    expire_cache_for(edition)
  end
 
  def after_destroy(edition)
    expire_cache_for(edition)
  end
 
  private
  def expire_cache_for(edition)
    expire_page(:controller => 'contributors', :action => 'index')
    expire_page(:controller => 'public', :action => 'editors_letter')
    expire_page(:controller => 'public', :action => 'fron_cover')
    expire_page(:controller => 'public', :action => 'index')
  end
end