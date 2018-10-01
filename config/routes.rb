Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "monitoring"     => "monitoring#index",       :as => "monitoring"
  #match "/monitoring" => "monitoring#index", :as => :monitoring
end
