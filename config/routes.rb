ActionController::Routing::Routes.draw do |map|
  
  map.editions_admin  '/admin/editions/:action', :controller => 'editions_admin'
  map.works_admin     '/admin/works/:action', :controller => 'works_admin'
  map.links_admin     '/admin/links/:action', :controller => 'links_admin'
  map.users_admin     '/admin/users/:action', :controller => 'users'
  
  map.resources :links

  map.resources :works
  
  map.resources :editions
  
  map.resources :contributors

  map.archives  '/archives/:action', :controller => 'editions'

  map.logout    '/logout', :controller => 'sessions', :action => 'destroy'
  map.login     '/login', :controller => 'sessions', :action => 'new'
  map.register  '/register', :controller => 'users', :action => 'create'
  map.signup    '/signup', :controller => 'users', :action => 'new'
  map.resources :users
  
  map.about_us    '/about_us', :controller => 'public', :action => 'about_us'
  map.editors_letter    '/editors_letter', :controller => 'public', :action => 'editors_letter'
  map.submit_page '/submit', :controller => 'public', :action => 'submit'
  map.home        '/home', :controller => 'public', :action => 'index'

  map.resource :session
  
  # remove this when new homepage ready
  map.root :controller => "public", :action => "front_cover"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
