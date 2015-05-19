Rails.application.routes.draw do

  resources :people do
  	#Dado un people en especifico, puede tener people 10/asociar/car
  	member do
  		get :asociar_car
  	end
    resources :addresses
    resources :albums
  end

  

  #get "/people" => "people#index"
  root to: "people#index"
end
