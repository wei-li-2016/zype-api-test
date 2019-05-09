class HomeController < ApplicationController
  # Get all the videos
  def index
    @videos = ZypeClient.all_videos
  end

  # Get video by id
  def watch_video
    @video = ZypeClient.single_video(params[:video_id])
  end

  # Authenticate user and store the access token in session
  def authenticate_user
    begin
      token = ZypeClient.oauth(user_params)
      session[:access_token] = token['access_token']
      redirect_to watch_video_path(video_id: user_params[:video_id])
    rescue => exception
      redirect_to watch_video_path(video_id: user_params[:video_id])
    end
  end

  # Remove access token from session
  def logout_user
    session.delete(:access_token)
    redirect_to root_path
  end

  private
    
    # Whilelist the user parameters
    def user_params
      params.require(:user).permit(:email, :password, :video_id)
    end
end
