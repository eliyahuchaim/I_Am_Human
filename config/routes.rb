Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, :comments, :tags, :thoughts, :users, :chats, :messages, except: [:new, :edit]
  get '/categories/:id/thoughts', to: 'ordered_thoughts#ordered_category_thoughts'

end
