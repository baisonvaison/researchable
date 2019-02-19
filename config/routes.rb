Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations', shared: 'users/shared'}
  
  devise_scope :user do
    root :to => 'devise/sessions#new'
    get '/users/sign_out' => 'users/sessions#destroy', as: "destroy_session"
    get '/users/delete' => 'users/registrations#destroy', as: "destroy_registration"
  end

  resources :protocols, only: [:index, :show, :new, :create, :destroy] do
    resources :procedures, only: [:index, :show, :new, :create]
  end

  root 'protocols#new'



  #ログイン＆新規登録画面
    #root 'users#index'
    get 'users/labo' => 'labo#retrieve_labo', as: 'retrieve_labo'
    post 'users/labo' => 'labo#find_labo', as: "find_labo"
    get  'users' => 'users#index'
    get  'thanks' => 'thanks#index'

     #管理画面トップ
    get  'admin' => 'admin#index'


   #研究室新規登録ページ&研究室ページ
    get  'labo' => 'labo#index'
    get  'labo/show' => 'labo#show'
    get  'labo/new' => 'labo#new', as: "new_affiliation"
    post 'labo/new' => 'labo#create', as: "affiliations"
    

   #研究室パスワード移行ページ
    get  'labo_pass' => 'labo_pass#index'


  #実験結果ページ
    get  '/experiment' => 'experiment#index'
    get  'experiment/show' => 'experiment#show'
    get  '/experiment/new' => 'experiment#new', as: "new_experiment"
    post '/experiment' => 'experiment#create', as: "experiments"

  #研究室所属一覧


  get 'pages/show'
    get  'login' => 'login#index'
    get  'login/new'  =>  'login#new'
    get  'user' => 'user#index'
    get  'user/show' => 'user#show'

  #スタンダード(テンプレート)プロトコル一覧
    get  'standard' => 'standard#index'
    get  'standard/show' => 'standard#show'
    get  'standard/new' => 'standard#new'

  #ベースプロトコル一覧
    get  'base' => 'base#index'
    get  'base/show' => 'base#show'
    get  'base/new' => 'base#new'

  #カスタムプロトコル一覧
    get  'custom' => 'custom#index'
    get  'custom/show' => 'custom#show'
    get  'custom/new' => 'custom#new'

  #研究室パスワード移行ページ
    get  'category' => 'category#index'
    get 'category/new' => 'category#new'

   #研究室パスワード移行ページ
    get  'search' => 'search#index'


  end
