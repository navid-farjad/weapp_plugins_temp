Rails.application.routes.draw do
  mount PluginJira::Engine => "/plugin_jira"
end
