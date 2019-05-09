Rails.application.routes.draw do
  get 'watch_video', to: 'home#watch_video'
  post 'authenticate_user', to: 'home#authenticate_user'
  get 'logout_user', to: 'home#logout_user'
  root 'home#index'
end
