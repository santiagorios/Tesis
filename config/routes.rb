VirtusKnowledge::Application.routes.draw do

  match "/departments/:id/timeline" => "departments#timeline"

  match "/knowledge_areas/:id/timeline" => "knowledge_areas#timeline"

  match "/research_lines/:id/timeline" => "research_lines#timeline"

  match "/users/:id/timeline" => "users#timeline"
  get "/users/:id" => "users#timeline"
  match "/users/:id/all" => "users#show"

  get "timeline" => "pages#timeline", :as => "timeline"

  get "departments/show"

  get "departments/index"

  get "help" => "pages#help", :as => "help"

  get "about" => "pages#about", :as => "about"

  get "explore" => "pages#explore", :as => "explore"

  get "myaccount" => 'users#myaccount', :as => "myaccount"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  get "signup" => "users#new", :as => "signup"

  resources :users
  resources :sessions
  resources :entries
  resources :research_lines
  resources :knowledge_areas
  resources :departments

  get "myentries" => "entries#myentries", :as => "myentries"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
