require_dependency "plugin_jira/application_controller"

module PluginJira
  class IssuesController < ApplicationController

    def create
      settings = ::PluginJira::Issue::Create.run!(params.merge(token: request.authorization))
      render json: { settings: settings }
    end

  end
end
