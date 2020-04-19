Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/questions" => "questions#index"
    post "/questions" => "questions#create"
    get "/questions/:id" => "questions#show"
    patch "/questions/:id" => "questions#update"
    delete "/questions/:id" => "questions#destroy"
    get "/answers" => "answers#index"
    post "/answers" => "answers#create"
    get "/answers/:id" => "answers#show"
    patch "/answers/:id" => "answers#update"
    delete "/answers/:id" => "answers#destroy"
  end
end
