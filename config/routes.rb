Rails.application.routes.draw do
  resources :shoes do
    get :hovercard, on: :member
  end
end
