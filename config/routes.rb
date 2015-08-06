Rails.application.routes.draw do
  devise_for :users
  get '/posts/alltime', to: 'posts#alltime'
  get '/posts/week', to: 'posts#week'
  get '/posts/month', to: 'posts#month'
  get '/posts/open', to: 'posts#open'
  # get '/posts/search', to: 'posts#search'
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote" 
    end
    resources :comments
  end



  

  root 'posts#index'
end
