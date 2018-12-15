Rails.application.routes.draw do
  root to: 'pages#home'
  get :autocomplete, to: 'pages#autocomplete'
end
