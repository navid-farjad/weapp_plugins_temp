class ::PluginGoogleMeet::PluginSetting::Show < ActiveInteraction::Base
  string :token

  def execute
    PluginGoogleMeet::Setting.find_by(token: token)

  end
end
