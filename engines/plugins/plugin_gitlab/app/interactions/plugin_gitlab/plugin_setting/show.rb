class ::PluginGitlab::PluginSetting::Show < ActiveInteraction::Base
  string :token

  def execute
    PluginGitlab::Setting.find_or_create_by(token: token)
  end
end
