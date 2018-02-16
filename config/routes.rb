Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/contact' => 'welcome#contact'
  get '/portfolio' => 'welcome#portfolio'
  root 'welcome#index'
end
