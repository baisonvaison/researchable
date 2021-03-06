Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', shared: 'users/shared'}

  devise_scope :user do
    authenticated :user do
      root 'labo#show', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
    get '/users/sign_out' => 'users/sessions#destroy', as: "destroy_session"
    get '/users/delete' => 'users/registrations#destroy', as: "destroy_registration"
    get 'users/labo' => 'users/registrations#retrieve_labo', as: 'retrieve_labo'
    post 'users/labo' => 'users/registrations#find_labo', as: "find_labo"
  end

  resources :protocols, only: [:index, :show, :new, :create, :destroy] do
    resources :procedures, only: [:create]
  end
  resources :custom_protocols, only: [ :new]


  #ログイン＆新規登録画面
    get  'thanks' => 'thanks#index'

     #管理画面トップ
    get  'admin' => 'admin#index'


   #研究室新規登録ページ&研究室ページ
    get  'labo' => 'labo#index'
    get  'labo/show/:id' => 'labo#show', as: "labo_show"
    get  'labo/new' => 'labo#new', as: "new_affiliation"
    post 'labo/new' => 'labo#create', as: "affiliations"

   #研究室パスワード移行ページ
    get  'labo_pass/:id' => 'labo_pass#index', as: "labo_pass"

  #実験結果ページ
    get  'experiment' => 'experiment#index'
    get  'experiment/show/:id' => 'experiment#show', as: "experiment_show"
    get  'experiment/new' => 'experiment#new', as: "new_experiment"
    post 'experiment/new' => 'experiment#create', as: "experiments"
    
  #コメント
    post 'experiment/show/:id' => 'experiment#comment_create', as: "comments"

  #研究室所属一覧


  get 'pages/show'
    get  'login' => 'login#index'
    get  'login/new'  =>  'login#new'
    get  'user' => 'user#index'
    get  'user/show/:id' => 'user#show', as: "user_show"

  #スタンダード(テンプレート)プロトコル一覧
    get  'standard' => 'standard#index'
    get  'standard/show/:id' => 'standard#show', as: "standard_show"
    get  'standard/new' => 'standard#new'

  #ベースプロトコル一覧
    get  'base' => 'base#index'
    get  'base/show/:id' => 'base#show', as: "base_show"
    get  'base/new' => 'base#new'

  #カスタムプロトコル一覧
    get  'custom' => 'custom#index'
    get  'custom/show/:id' => 'custom#show', as: "custom_show"
    get  'custom/new' => 'custom#new'


    get  'search' => 'search#index'


  end
