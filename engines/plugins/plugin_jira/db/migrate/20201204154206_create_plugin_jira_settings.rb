class CreatePluginJiraSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :plugin_jira_settings do |t|
      t.string :token
      t.string :jira_user_name
      t.string :jira_password
      t.string :jira_project_key
      t.string :jira_url

      t.timestamps
    end
  end
end
