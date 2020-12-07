module PluginGitlab
  class ApplicationController < ActionController::Base
    #protect_from_forgery with: :exception
    skip_forgery_protection

    before_action :check_token


    private

    def check_token
      api_url = 'https://beta-api.weapp.io'
      resp = HTTParty.get(api_url + '/api/init/sessions/id',
                          headers: { 'Content-Type': 'application/json', "Authorization": request.authorization })

      session = JSON.parse(resp.response.body)
      return errors.add(:wrong, 'token') if session['user']['id'].blank?
    end

  end
end
