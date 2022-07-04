Rails.application.routes.draw do
  devise_for :users, controllers: {
    registration: 'users/registrations',
    sessions: 'users/sessions' 
  } 

  root "site#home"
end
