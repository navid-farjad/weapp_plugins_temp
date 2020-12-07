class CreatePluginGoogleMeetSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :plugin_google_meet_settings do |t|
      t.string :token

      t.timestamps
    end
  end
end
