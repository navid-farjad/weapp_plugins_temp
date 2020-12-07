require_dependency "plugin_gitlab/application_controller"

module PluginGitlab
  class ProjectsController < ApplicationController

    def index
      projects = ::PluginGitlab::Project::Index.run!(params.merge(token: request.authorization))
      render json: { projects: projects }
    end

  end
end