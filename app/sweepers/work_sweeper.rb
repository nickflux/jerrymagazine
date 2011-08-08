class WorkSweeper < ActionController::Caching::Sweeper
  observe Work
 
  def after_create(work)
    expire_cache_for(work)
  end
 
  def after_update(work)
    expire_cache_for(work)
  end
 
  def after_destroy(work)
    expire_cache_for(work)
  end
 
  private
  def expire_cache_for(work)
    expire_page(:controller => 'works', :action => 'show', :id => work)
    work.work_pages.each_with_index do |work_page, index|
      expire_page(:controller => 'works', :action => 'show', :id => work, :page => index+1 )
    end
 
    expire_page(:controller => 'public', :action => 'index')
  end
end