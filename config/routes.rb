Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount PluginGitlab::Engine, at: 'plugins/plugin_gitlab'
  mount PluginJira::Engine, at: 'plugins/plugin_jira'
  mount PluginGoogleMeet::Engine, at: 'plugins/plugin_google_meet'
end
