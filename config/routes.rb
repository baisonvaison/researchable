Rails.application.routes.draw do

  root 'pages#index'
  get 'pages/show'
    get  'login' => 'login#index'
    get  'login/new'  =>  'login#new'
    get  'user' => 'user#index'
    get  'researchable'  =>  'researchable#index'
    get  'researchable/new'  =>  'researchable#new'
  end
