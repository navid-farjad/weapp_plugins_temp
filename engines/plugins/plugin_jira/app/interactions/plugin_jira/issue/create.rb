class ::PluginJira::Issue::Create < ActiveInteraction::Base
  string :description
  integer :ticket_id
  string :token
  string :username

  def execute
    settings = PluginJira::Setting.find_by(token: token)

      options = {
          :username => settings.jira_user_name, # User Email
          :password => settings.jira_password, # API token for the user
          :site => 'https://weapp.atlassian.net/', # Jira Host URL
          :context_path => '',
          :auth_type => :basic # Auth Type : Basic Authorization
      }
      client = JIRA::Client.new(options)
      account = client.get("#{client.options[:rest_base_path]}/user/search?query=#{username}").body
      uri = URI.parse("https://#{settings.jira_url}/rest/api/2/issue/")
      json = {
          'fields' => {
              project: {key: settings.jira_project_key},
              summary: ticket_id.to_s,
              issuetype: {name: "Task"},
              description: description
          }
      }

      unless account == '[]'
        account_id = JSON.parse(account)[0]['accountId']
        json = {
            'fields' => {
                project: {key: settings.jira_project_key},
                summary: ticket_id.to_s,
                issuetype: {name: "Task"},
                assignee: {id: account_id},
                description: description
            }
        }
      end
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
      request.body = json.to_json
      request.basic_auth(settings.jira_user_name, settings.jira_password)
      http.request(request)
    'sent'

  end
end
