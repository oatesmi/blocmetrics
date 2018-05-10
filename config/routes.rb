Rails.application.routes.draw do
  get 'registered_applications/index'

  get 'registered_applications/show'

  get 'registered_applications/new'

  get 'registered_applications/create'

  get 'registered_applications/edit'

  get 'registered_applications/update'

  get 'registered_applications/destroy'

  get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
end
