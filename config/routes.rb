Rails.application.routes.draw do
  resources :lists, only: %i[index create show new] do
    resources :bookmarks, only: %i[create new]
  end
  resources :bookmarks, only: :destroy
  root to: 'lists#index'
end
