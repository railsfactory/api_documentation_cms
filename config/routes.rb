MLSApidoc::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  resources :static_pages

  resources :parameters

  resources :api_methods

  resources :api_lists

  devise_for :users
   
  resources :admin
  
  resources :home
  match "/methods/:id" => "api_methods#method_desc", :as=>:api_method_desc
  match "/download" => "home#downloads", :as=>:api_doc_download
  match "/download_file" => "home#download_file"
  match "/api_documentation"=>"home#api_doc",:as=>:api_doc
  match "/auth_documentations"=>"home#auth_doc",:as=>:auth_doc
  match "/error-codes"=>"home#error_code",:as=>:error_code
  match "/http-codes"=>"home#http_code",:as=>:http_code
  match "/getting-started"=>"home#getting_started",:as=>:getting_started
  match "/api/:id"=>"api_methods#new"
  match "/apimethods/:id"=>"api_methods#index"
  match "/api_destroy/:id"=>"api_lists#api_destroy",:as=>:api_destroy
  match "/apimethod_destroy/:id"=>"api_methods#apimethod_destroy",:as=>:apimethod_destroy
  match "/getting_started"=>"home#getting_started",:as=>:getting_started
  match "/delete/:id"=>"api_methods#delete_parameter",:as=>:delete_parameter
  match '/settings', :to => 'admin#settings'
  match '/update_settings', :to => 'admin#update_settings'
  match '/post_api_request', :to => 'api_methods#post_api_request'
  match '/put_api_request', :to => 'api_methods#put_api_request'
  match '/get_api_request', :to => 'api_methods#get_api_request'
  match '/delete_api_request', :to => 'api_methods#delete_api_request'
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
   root :to => "home#getting_started"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
