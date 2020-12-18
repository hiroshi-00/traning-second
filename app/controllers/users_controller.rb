class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite_tweets = @user.favorite_tweets
    
    tweets = @user.tweets.pluck(:created_at, :my_height, :my_weight, :time)
    @datas = tweets.map(&:first)
    @height = tweets.map(&:second)
    @weight = tweets.map(&:third)
    @time = tweets.map(&:fourth)
    @bmi = []
    
    aaa = [[@height, @weight]]

    aaa.each do |height, weight|
      height.each do |hhh|
        @aa = hhh.to_f / 100
      end
      weight.each do |www|
        bbb = www / (@aa * @aa)
        @bmi.push(bbb.floor(1).to_f)
      end
    end
    
    
  end

  private 
    def user_params
      params.require(:user).permit(:user_id, :username, :email, :password, :usertype, :message, :uid, :provider)
    end
end


