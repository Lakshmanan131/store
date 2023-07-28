Rails.application.routes.draw do

  resources :colleges do
    resources :students
  end
  root 'colleges#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
