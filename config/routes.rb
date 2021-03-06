Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'pages#index'
  get 'expenses', to: 'pages#expenses'
  get 'debt', to: 'pages#debt'
  get 'tos', to: 'pages#terms_of_service'
  get 'pricecomp', to: 'pages#pricecomp'
  get 'about', to: 'pages#about'
  get "new", to: "pages#new", as: "new"
  post "create", to: "pages#create", as: "create"
  get 'live_search', to: "pages#live_search"
  get 'trip/:id', to: 'pages#trip', as: "trip"
  post 'trip/:id', to: 'pages#create_trip'
  get 'shopping_trip/:id', to: 'pages#shopping_trip', as: "shopping_trip"
  get 'copy', to: 'pages#copy', as: "copy"
  delete "edit_debt", to: "pages#edit_debt", as: "edit_debt"
  get 'debt_show/:user', to: 'pages#debt_show', as: "debt_show"

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
