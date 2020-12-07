class ::PluginGitlab::Issue::Create < ActiveInteraction::Base
  integer :project_id
  string :title
  string :description, default: nil
  string :labels, default: nil
  string :token

  def execute
    settings = PluginGitlab::Setting.find_or_create_by(token: token)
      api_host = 'https://' + settings.gitlab_url + '/api/v4/projects/' + project_id.to_s + '/issues'

      query = {
        "title" => title,
        "description" => description,
        "labels" => labels
      }

      HTTParty.post(api_host,
                    headers: { 'Content-Type': 'application/json', "PRIVATE-TOKEN": settings.gitlab_token },
                    query: query)


  end
end
