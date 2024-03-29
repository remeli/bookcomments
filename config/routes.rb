# encoding: utf-8
Bookcomments::Application.routes.draw do 
  
  resources :articles, :only => [:index, :show]
  
  match "/pages/:id" => "articlecategories#show", :as => "articlecategory"

  # admin:
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  # categories:
  resources :categories, :only => [:index, :show] do
    # page kaminari:
    get ":id/page/:page.:format", :action => :show, :on => :collection, :defaults => { :format => "html"}
  end
  
  # books:
  resources :books, :only => [:index, :show, :alphabet] do
    resources :comments
    member do
      get :plus
      get :minus
      get :neitral
    end
    get "page/:page.:format", :action => :index, :on => :collection, :defaults => { :format => "html"}
  end
  
  match "alphabet/:alphasym" => "books#alphabet", :as => :alphabet
  
  match "top20comments" => "books#topcomments", :as => :top20

  # authors
  resources :authors, :only => [:index, :show] do
    get "page/:page.:format", :action => :index, :on => :collection, :defaults => { :format => "html"}
  end
  
  # pages:
  match "/about" => "pages#about"
  match "/contacts" => "pages#contacts"
  match "/agreement" => "pages#agreement"
  
  # search:
  match "search" => "search#index"
  
  # archive:
  match "archive" => "archive#index"
  match "archive/:year" => "archive#show", :constraints => { :year => /\d{4}/ }, :as => "archiveyear"
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Sample resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Sample resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Sample resource route with more complex sub-resources
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', :on => :collection
  # end
  # end

  # Sample resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end