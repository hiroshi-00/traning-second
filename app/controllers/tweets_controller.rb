class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :tweet_search, only: [:index]
  before_action :twitter_client, only: [:create]
  
  def index
  end

  def show
    @favorite = Favorite
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      @client.update("#{@tweet.title}\r#{@tweet.time}\r#{@tweet.body}\r")
      redirect_to tweet_path(@tweet), notice: "投稿が完了しました。"
    else
      render :new, notice: "投稿できませんでした。"
    end
  end

  def edit
  end
  
  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet), notice: "投稿が編集しました。"
    else
      render :edit, notice: "投稿を編集できませんでした。"
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました"
  end
  
  
  
  private
    def tweet_params
      params.require(:tweet).permit(:user_id, :title, :body, :my_height, :my_weight, :time)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
    def tweet_search
      if params[:search].present?
        @tweets = Tweet.where("body LIKE ?", "%#{params[:search]}%")
      else
        @tweets = Tweet.all
      end
    end
    
    # ツイッターAPI
    def twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key         = ENV['CONSUMER_KEY']
        config.consumer_secret      = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['ACCESS_TOKEN']
        config.access_token_secret  = ENV['ACCESS_TOKEN_SECRET']
      end
    end
      
end