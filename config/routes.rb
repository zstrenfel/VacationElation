Rails.application.routes.draw do
  resources :trips
  resources :users
  resources :destinations

  #how to use routing
  #Get User
  # => Get http://localhost:3000/users/:id.json
  # => return:
#   {
#   "user": {
#     "id": {
#       "$oid": "56d21922bcce02e87aff4d91"
#     },
#     "name": "Moreno",
#     "email": "moreno@moreno.name",
#     "gender": "F",
#     "password": "12345678",
#     "trips": [
#       {
#         "id": {
#           "$oid": "56d21921bcce02e87aff4d7f"
#         }
#       }
#     ]
#   }
# }

  #Create User
  # => Post http://localhost:3000/users.json, body => json

  #Get Destinations
  # =>  Get http://localhost:3000/destinations.json

  #Get Destination
  # => Get http://localhost:3000/destinations/:id.json
  # => return:
# {
#   "destination": {
#     "id": {
#       "$oid": "56d21120bcce02e87aff4cdc"
#     },
#     "city": "Ryderwood",
#     "state": "Idaho",
#     "country": "Brazil",
#     "description": "Lorem adipisicing proident consectetur tempor fugiat."
#   }
# }

  #Get Trips
  # => Get http://localhost:3000/trips.json

  #Get Trip
  # => Get http://localhost:3000/trips/:id.json
  # => return:
# {
#   "trip": {
#     "id": {
#       "$oid": "56d21120bcce02e87aff4cd2"
#     },
#     "departure_airport": "JFK",
#     "hotel_prices": 414,
#     "depart_price": 420,
#     "return_price": 545,
#     "date_start": "2016-03-03",
#     "date_end": "2016-03-14",
#     "destination": {
#       "id": {
#         "$oid": "56d21120bcce02e87aff4cdc"
#       },
#       "city": "Ryderwood",
#       "state": "Idaho",
#       "country": "Brazil",
#       "description": "Lorem adipisicing proident consectetur tempor fugiat."
#     }
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
