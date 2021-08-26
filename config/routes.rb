Rails.application.routes.draw do
  namespace :apis do
    namespace :v1 do
      post '/signup', to: 'users#create'
      resources :users do
        post 'article_publishing', on: :collection
        get 'followed_articles', on: :collection
      end
      post '/sign_in', to: 'sessions#create'
    end
  end
end
