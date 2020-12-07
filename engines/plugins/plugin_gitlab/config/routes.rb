PluginGitlab::Engine.routes.draw do

  resource :settings, only: %i[show update]
  resources :projects, only: %i[index]
  resources :issues, only: %i[create]

end
