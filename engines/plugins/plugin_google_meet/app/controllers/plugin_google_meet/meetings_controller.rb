require_dependency "plugin_google_meet/application_controller"

module PluginGoogleMeet
  class MeetingsController < ApplicationController

    def create
      meeting = ::PluginGoogleMeet::Meeting::Create.run!(params.merge(token: request.authorization))
      render json: { meeting: meeting }
    end

  end
end