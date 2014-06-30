Rails.application.routes.draw do

  resources :announcements

  resources :comments

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"

  resources :tickets

  devise_for :clubs
  get 'clubs/admin'
  get 'clubs/' => "clubs#index"
  
  get 'clubs_controller/show'
  get 'clubs_controller/index'
  get 'clubs_controller/admin'
  get "/clubs/:id" => "clubs#show", as: :club
  get "/my_clubs" => "clubs#my_clubs", as: :my_clubs
  put "/clubs/:club_id/like" => "clubs#like", as: :like
  devise_for :users
  get 'users/admin'
  get 'users/show'
  get 'users/index'
  
  resources :events do
    resources :tickets
  end

  get "/my_events" => "events#my_events", as: :my_events
  get "/events/:event_id/report" => "events#report", as: :report

  put "/events/:event_id/tickets/:id/reserve" => "tickets#reserve", as: :reserve_ticket
  put "/events/:event_id/follow" => "events#follow", as: :follow

  get "/my_tickets" => "tickets#my_tickets", as: :my_tickets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'clubs#index'

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
