Rails.application.routes.draw do
  # フルルーティング
  resources :books

  # rootメソッドを使用して / をトップ画面にする
  root :to => 'books#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
