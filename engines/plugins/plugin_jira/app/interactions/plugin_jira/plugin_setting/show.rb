class ::PluginJira::PluginSetting::Show < ActiveInteraction::Base
  string :token

  def execute
    PluginJira::Setting.find_or_create_by(token: token)
  end
end
