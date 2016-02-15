Rails.application.routes.draw do

  get 'guest/index'
  post 'rate_restaurant/:id' => 'guest#rate_restaurant', as: :rate_restaurant

  get 'bulk_reservation/bulk_reserve'

 # resources :tables do
#	  resources :bookings
#	end
 # resources :tables do
#		end
  # resources :meals
  get 'add_friends' => 'friendship_management#add_friends'

  get 'manage_friend_requests' => 'friendship_management#manage_pending_friend_requests'

  get 'my_friends' => 'friendship_management#my_friends'

  post 'add_to_friends' => 'friendship_management#add_to_friends'
  post 'accept_friend_request' => 'friendship_management#accept_friend_requests'
  post 'decline_friend_request' => 'friendship_management#decline_friend_requests' 
  post 'remove_from_friends' => 'friendship_management#remove_from_friends'

  get 'add_manager' => 'add_manager#index'
  post 'add_manger' => 'add_manager#create'
  get 'router/index'
  get 'forbidden_acces' => 'forbidden_acces#index'

  resources :restaurants do
    resources :meals
    resources :tables do
      resources :bookings
    end
    post 'bulk_reserve' => 'bulk_reservation#bulk_reserve'
  end
  
  

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'} , :controllers => { registrations: 'registrations' }

  root 'restaurants#index' 
  #get 'forbidden_acces/index', as: :forbidden

# devise_scope :user do
#	  root to: "devise/sessions#new"
# end 

 #   	devise_for :users
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
