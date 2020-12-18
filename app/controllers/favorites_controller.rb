class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end