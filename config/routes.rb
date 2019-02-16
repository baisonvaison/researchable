Rails.application.routes.draw do

  devise_for :users

  #ログイン＆新規登録画面
    root 'users#index'
    get  'users' => 'users#index'
    get  'users/new' => 'users#new'
    get  'thanks' => 'thanks#index'

     #管理画面トップ
    get  'admin' => 'admin#index'


   #研究室新規登録ページ&研究室ページ
    get  'labo' => 'labo#index'
    get  'labo/show' => 'labo#show'
    get  'labo/new' => 'labo#new'

   #研究室パスワード移行ページ
    get  'labo_pass' => 'labo_pass#index'


  #実験結果ページ
    get  'experiment' => 'experiment#index'
    get  'experiment/show' => 'experiment#show'
    get  'experiment/new' => 'experiment#new'

  #研究室所属一覧
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

   #研究室パスワード移行ページ
    get  'search' => 'search#index'


  end
