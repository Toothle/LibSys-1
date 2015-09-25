Rails.application.routes.draw do

  get  'suggest' =>  'suggests#new'

  resources :suggests




  get 'se2sions/new'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'

  get  'about'=>  'static_pages#about'

  get 'contact' =>'static_pages#contact'


  get 'signup'  => 'members#new'
  get    'login'   => 'se2sions#new'
  post   'login'   => 'se2sions#create'
  delete 'logout'  => 'se2sions#destroy'
  get  'members_path' => 'members#index'
  get  'members/members_path' => 'members#index'
  get 'add_admin'  => 'members#add_admin'
  resources :members

  get 'searchbook' => 'members#find_book'

  # get '/books/:id', to: 'books#show'
  # delete '/books/:id/show_and_destroy', to: 'books#show_and_destroy'
  resources :books


  get 'addbook' => 'books#new'
  # delete 'show_and_destroy' => '/books/:id/books#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
