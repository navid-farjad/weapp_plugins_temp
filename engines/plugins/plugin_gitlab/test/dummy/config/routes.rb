Rails.application.routes.draw do
  mount PluginGitlab::Engine => "/plugin_gitlab"
end
