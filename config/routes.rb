ActionController::Routing::Routes.draw do |map|
  map.resources :questions, :collection => {:admin => :get}, :member => {:disable => :put}
end
