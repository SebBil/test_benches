# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
  resources :id

  get '/projects/:id/benches', to: 'benches#index'
  post '/projects/:id/benches/new_bench', to: 'benches#create_bench'
  get '/projects/:id/benches/new_bench', to: 'benches#new_bench'

  get '/projects/:id/benches/:bench', to: 'benches#show_bench'

  resources :bench

  get '/projects/:id/benches/edit_bench/:bench', to: 'benches#edit_bench'
  post '/projects/:id/benches/edit_bench/:bench', to: 'benches#update_bench'
  patch '/projects/:id/benches/edit_bench/:bench', to: 'benches#update_bench'
  get '/projects/:id/benches/edit_bench/:bench/delete', to: 'benches#delete_bench'

  get '/projects/:id/benches/:bench/new_ecu', to: 'ecus#new_ecu'
  post '/projects/:id/benches/:bench/new_ecu', to: 'ecus#create_ecu'

  resources :ecu

  get '/projects/:id/benches/edit_bench/:bench/:ecu/edit_ecu', to:'ecus#edit_ecu'
  post '/projects/:id/benches/edit_bench/:bench/:ecu/edit_ecu', to: 'ecus#update_ecu'
  get '/projects/:id/benches/edit_bench/:bench/:ecu/delete', to:'ecus#delete_ecu'
end

# Rails.application.routes.draw do
#   root 'benches#index'
#
#   resources :id do
#     get :index
#     get :new_bench
#     get :show_bench
#     post :create_bench
#
#     resources :bench do
#       get :new_ecu
#       post :create_ecu
#       get :edit_bench
#       post :update_bench
#       get :delete_bench
#
#       resources :ecu do
#         get :edit_ecu
#         get :delete_ecu
#         post :update_ecu
#       end
#     end
#   end
# end
