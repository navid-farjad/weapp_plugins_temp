require_dependency "plugin_google_meet/application_controller"

module PluginGoogleMeet
  class SettingsController < ApplicationController

    def show
      settings = ::PluginGoogleMeet::PluginSetting::Show.run!(token: request.authorization)
      render json: { settings: settings }
    end


  end
end