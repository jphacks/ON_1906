Rails.application.routes.draw do
  root to: 'calendars#index'
  get 'home/index'
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
