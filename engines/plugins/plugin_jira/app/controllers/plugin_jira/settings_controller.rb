require_dependency "plugin_jira/application_controller"

module PluginJira
  class SettingsController < ApplicationController

    def show
      settings = ::PluginJira::PluginSetting::Show.run!(params.merge(token: request.authorization))
      render json: { settings: settings }
    end

    def update
      settings = ::PluginJira::PluginSetting::Update.run!(params.merge(token: request.authorization))
      render json: { settings: settings }
    end

  end
end
