PluginJira::Engine.routes.draw do
  resource :settings, only: %i[show update]
  resources :issues, only: %i[create]
end
