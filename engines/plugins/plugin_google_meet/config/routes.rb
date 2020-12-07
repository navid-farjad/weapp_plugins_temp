PluginGoogleMeet::Engine.routes.draw do

  resource :settings, only: %i[show update ]
  resource :meetings, only: %i[create]

end
