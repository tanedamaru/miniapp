Rails.application.routes.draw do
  devise_for :users
  get   '/users', to: redirect("/users/sign_up")
  root  'postings#index'                        #ルートパスの指定
  post  'postings/new' => 'postings#create'
  resources :postings do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show]
end
