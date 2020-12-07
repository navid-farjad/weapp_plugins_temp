class ::PluginGitlab::Project::Index < ActiveInteraction::Base
  string :token

  def execute
    settings = PluginGitlab::Setting.find_by(token: token)

    api_host = 'https://' + settings.gitlab_url + '/api/v4/projects'
    query = { simple: true, membership: true }
    r = HTTParty.get(api_host,
                     headers: { 'Content-Type': 'application/json', "PRIVATE-TOKEN": settings.gitlab_token },
                     query: query)

    projects_array = []
    r.each do |project|
      project_hash = {}
      project_hash[:id] = project['id']
      project_hash[:name] = project['name']
      projects_array.push project_hash
    end

    projects_array

  end
end
