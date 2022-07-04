Rails.application.routes.draw do
  devise_for :users, controllers: {
    registration: 'users/registrations',
    sessions: 'users/sessions', as: 'session' 
  } 

  root "site#home"
end
