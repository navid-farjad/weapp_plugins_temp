class ::PluginJira::PluginSetting::Update < ActiveInteraction::Base
  string :jira_user_name
  string :jira_password
  string :jira_project_key
  string :jira_url
  string :token

  def execute
    settings = PluginJira::Setting.find_or_create_by(token: token)
    settings.update(jira_user_name: jira_user_name,
                    jira_password: jira_password,
                    jira_project_key: jira_project_key,
                    jira_url: jira_url)
    settings

  end
end
