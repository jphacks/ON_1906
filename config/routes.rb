Rails.application.routes.draw do
  root to: 'calendars#index'
  get 'calendars/get_events' => 'calendars#get_events'

  get '/redirect', to: 'calendars#redirect', as: 'redirect'
get '/callback', to: 'calendars#callback', as: 'callback'

  get 'home/index'
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
