module HomeHelper
  # Provide access token and app key based on subscription
  def required_key(video)
    video['subscription_required'] ? "access_token=#{session[:access_token]}" : "app_key=#{ENV['ZYPE_APP_KEY']}"
  end
end
