Rails.application.routes.draw do

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

  resources :books

  resources :histories, only: [:create, :index]

end