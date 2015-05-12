Rails.application.routes.draw do

  resources :people do
    resources :addresses
  end
  
  #get "/people" => "people#index"
  root to: "people#index"
end
