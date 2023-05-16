Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :schedules
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :stock_locations do
        member do
          get :schedules
        end
      end
    end
  end
end
