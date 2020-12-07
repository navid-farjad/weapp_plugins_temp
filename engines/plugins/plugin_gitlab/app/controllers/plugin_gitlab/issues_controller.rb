require_dependency "plugin_gitlab/application_controller"

module PluginGitlab
  class IssuesController < ApplicationController

    def create
      issue = ::PluginGitlab::Issue::Create.run!(params.merge(token: request.authorization))
      render json: { issue: issue }
    end

  end
end