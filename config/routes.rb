Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'stats/' => 'static_pages#stats', as: :stats
  get 'about/' => 'static_pages#about', as: :about

  get 'quotes/awaiting' => 'quotes#awaiting', as: :awaiting_quotes
  get 'quotes/by_author/:author' => 'quotes#by_author', as: :author_quotes
  get 'quotes/:id/approve' => 'quotes#approve', as: :approve_quote
  get 'quotes/:id/bioreactor' => 'quotes#bioreactor_edit', as: :bioreactor_quote
  patch 'quotes/:id/devnull' => 'quotes#bioreactor_update', as: :devnull_quote
  get 'quotes/bioreactor' => 'quotes#bioreactor_index', as: :bioreactor_quotes
  resources :quotes

  resources :messages

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
