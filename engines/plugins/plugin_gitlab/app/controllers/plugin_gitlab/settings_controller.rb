require_dependency "plugin_gitlab/application_controller"

module PluginGitlab
  class SettingsController < ApplicationController

    def show
      settings = ::PluginGitlab::PluginSetting::Show.run!(params.merge(token: request.authorization))
      render json: { settings: settings }
    end

    def update
      settings = ::PluginGitlab::PluginSetting::Update.run!(params.merge(token: request.authorization))
      render json: { settings: settings }
    end

  end
end
