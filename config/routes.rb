ActionController::Routing::Routes.draw do |map|
  map.resources :questions, :collection => {:admin => :get}
end
