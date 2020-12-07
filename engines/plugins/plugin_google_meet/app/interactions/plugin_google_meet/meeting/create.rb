class ::PluginGoogleMeet::Meeting::Create < ActiveInteraction::Base
  array :canal_ids
  string :token

  def execute
    api_url = 'https://beta-api.weapp.io'
    resp = HTTParty.get(api_url + '/api/init/sessions/id',
                        headers: { 'Content-Type': 'application/json', "Authorization": token })

    session = JSON.parse(resp.response.body)

    chat_id = 'weapp_' + session['company']['created_at'].to_s + '_' + session['company']['id'].to_s + '_' + canal_ids[0].to_s
    message = 'join me on ' + 'https://g.co/meet/' + chat_id

    HTTParty.get(api_url + '/api/chat/comments',
                 headers: { 'Content-Type': 'application/json', "Authorization": token },
                 body: { message: message,
                         canal_ids: canal_ids,
                 }.as_json)

    'http://g.co/meet/' + chat_id

  end
end
