class CreatePluginGitlabSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :plugin_gitlab_settings do |t|
      t.string :token
      t.string :gitlab_token
      t.string :gitlab_url

      t.timestamps
    end
  end
end
