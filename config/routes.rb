Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/contact' => 'welcome#contact'
  get '/portfolio' => 'welcome#portfolio'
  get '/pps' => 'welcome#pps'
  get '/ipa' => 'welcome#ipa'
  root 'welcome#index'
end
