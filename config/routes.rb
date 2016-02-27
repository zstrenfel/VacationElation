Rails.application.routes.draw do
  resources :trips
  resources :users
  resources :destinations

  get 'users/:id' => 'users#show'
  #how to use routing
  #Get User
  # => Get http://localhost:3000/users/:id.json

  #Create USer
  # => Post http://localhost:3000/users.json, body => json

  #Get Destinations
  # =>  Get http://localhost:3000/destinations.json

  #Get Destination
  # => Get http://localhost:3000/destinations/:id.json
  #

  #Get Trips
  # => Get http://localhost:3000/trips.json

  #Get Trip
  # => Get http://localhost:3000/trips/:id.json
  # => return:
#   {
#   "trip": {
#     "id": {
#       "$oid": "56d1f0c4bcce02e87aff4bf6"
#     },
#     "departure_airport": "JFK",
#     "hotel_prices": 414,
#     "depart_price": 420,
#     "return_price": 545,
#     "date_start": "2016-03-03",
#     "date_end": "2016-03-14"
#   }
# }










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
