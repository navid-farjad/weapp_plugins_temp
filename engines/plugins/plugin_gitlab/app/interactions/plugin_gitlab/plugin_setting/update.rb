class ::PluginGitlab::PluginSetting::Update < ActiveInteraction::Base
  string :gitlab_token
  string :gitlab_url
  string :token

  def execute
    setting = PluginGitlab::Setting.find_or_create_by(token: token)
    setting.update(gitlab_token: gitlab_token, gitlab_url: gitlab_url)

    setting
  end
end
