Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/contact' => 'welcome#contact'
  get '/portfolio' => 'welcome#portfolio'
  get '/test' => 'welcome#test'
  # get '/manifest' => 'welcome#manifest'
  # get '/pps' => 'welcome#pps'
  # get '/ipa' => 'welcome#ipa'
  # get '/test' => 'welcome#test'
  # get '/testpps' => 'welcome#testpps'
  # get '/testipa' => 'welcome#testipa'
  post "/test-image" => 'welcome#test_image'
  root 'welcome#index'
end
