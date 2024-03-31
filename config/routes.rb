Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events # ルーティングをまとめて設定(index、new、create、show、edit、update、destroyアクションに対するルーティングを設定してくれる。)
  get "/" => 'events#index' # トップページの設定にはrootが用いられる
  
end
