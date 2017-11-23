Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      get "user/interests" => "topics_of_interest#index"
      post "user/interests/add" => "topics_of_interest#add"
      delete "user/interests/remove" => "topics_of_interest#remove"

      scope :format => true, :constraints => { :format => 'json' } do
        post   "/register"       => "sessions#register"
        post   "/login"       => "sessions#create"
        delete "/logout"      => "sessions#destroy"
      end
    end
  end
end
