VirtusKnowledge::Application.routes.draw do

  get "research_groups/index"

  get "research_groups/show"

  get "research_groups/create"

  get "research_groups/edit"

  get "research_groups/update"

  get "research_groups/destroy"

  get "research_groups/new"

  get "indicators/show"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  #match "/departments/:id/timeline" => "departments#timeline"
  #
  #match "/knowledge_areas/:id/timeline" => "knowledge_areas#timeline"
  #
  #match "/research_lines/:id/timeline" => "research_lines#timeline"
  #
  #match "/users/:id/timeline" => "users#timeline"
  #get "/users/:id" => "users#timeline"

  match "/research_groups/:id/programs" => "research_groups#programs"
  match "/research_groups/:id/projects" => "research_groups#projects"
  match "/research_groups/:id/results" => "research_groups#results"


  match "/research_lines/:id/programs" => "research_lines#programs"
  match "/research_lines/:id/projects" => "research_lines#projects"
  match "/research_lines/:id/results" => "research_lines#results"
  match "/research_lines/:id/entries" => "research_lines#entries"
  match "/research_lines/:id/research_sublines" => "research_lines#research_sublines"

  match "/research_sublines/:id/programs" => "research_sublines#programs"
  match "/research_sublines/:id/projects" => "research_sublines#projects"
  match "/research_sublines/:id/results" => "research_sublines#results"
  match "/research_sublines/:id/entries" => "research_sublines#entries"

  match "/knowledge_areas/:id/programs" => "knowledge_areas#programs"
  match "/knowledge_areas/:id/projects" => "knowledge_areas#projects"
  match "/knowledge_areas/:id/results" => "knowledge_areas#results"
  match "/knowledge_areas/:id/entries" => "knowledge_areas#entries"

  match "/departments/:id/knowledge_areas" => "departments#knowledge_areas"
  match "/departments/:id/programs" => "departments#programs"
  match "/departments/:id/projects" => "departments#projects"
  match "/departments/:id/results" => "departments#results"
  match "/departments/:id/entries" => "departments#entries"

  match "/users/:id/programs" => "users#programs"
  match "/users/:id/projects" => "users#projects"
  match "/users/:id/results" => "users#results"
  match "/users/:id/entries" => "users#entries"

  match "/programs/type/:id" => "programs#program_type"

  match "/research_groups/:object_id/type/:type_id" => "research_groups#program_type"
  match "/departments/:object_id/type/:type_id" => "departments#program_type"
  match "/users/:object_id/type/:type_id" => "users#program_type"

  match "search/:search" => "pages#search"
  match "search/" => "pages#search", :as => "search_general"


  get "departments/search/:search" => "departments#search"
  get "knowledge_areas/search/:search" => "knowledge_areas#search"
  get "research_lines/search/:search" => "research_lines#search"
  get "research_sublines/search/:search" => "research_sublines#search"
  get "programs/search/:search" => "programs#search"
  get "projects/search/:search" => "projects#search"
  get "results/search/:search" => "results#search"
  get "entries/search/:search" => "entries#search"
  get "users/search/:search" => "users#search"


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
  resources :research_sublines
  resources :knowledge_areas
  resources :departments
  resources :programs do
    resources :indicators
  end
  resources :projects
  resources :results
  resources :research_groups

  get "myentries" => "entries#myentries", :as => "myentries"

  get "myprograms" => "programs#myprograms", :as => "myprograms"
  get "myprojects" => "projects#myprojects", :as => "myprojects"
  get "myresults" => "results#myresults", :as => "myresults"

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
