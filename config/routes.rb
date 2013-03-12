Flashcards::Application.routes.draw do
  root to: "homes#show"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :decks do        #, only: [:index, :show]
    resources :cards, except: [:index]
  end
end

  # get "/decks" => "decks#index"
  # get "/decks/new" => "decks#new"
  # post "/decks" => "decks#create"
  # get "/decks/:id" => "decks#show", as: :deck 
  # get "/decks/:id/edit" => "decks#edit"
  # put "/decks/:id" => "decks#update"
  # delete "/decks/:id" => "decks#destroy"

