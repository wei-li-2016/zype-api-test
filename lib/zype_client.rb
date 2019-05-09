require 'json'
require 'rest-client'

class ZypeClient
  def self.all_videos
    response = RestClient.get("https://api.zype.com/videos?app_key=#{ENV['ZYPE_APP_KEY']}")
    JSON.parse(response)['response']
  end

  def self.single_video(video_id)
    response = RestClient.get("https://api.zype.com/videos/#{video_id}?app_key=#{ENV['ZYPE_APP_KEY']}")
    JSON.parse(response)['response']
  end

  def self.oauth(user)
    response = RestClient.post("https://login.zype.com/oauth/token?client_id=#{ENV['ZYPE_CLIENT_ID']}&client_secret=#{ENV['ZYPE_CLIENT_SECRET']}&username=#{user[:email]}&password=#{user[:password]}&grant_type=password", { content_type: :json })
    JSON.parse(response)
  end
end