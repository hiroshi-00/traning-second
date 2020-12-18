class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @user = User.new
    redirect_to tweets_path if user_signed_in?
  end
  
  
  def create
    if @user.save #ユーザーのインスタンスが新しく生成されて保存されたら
      NotificationMailer.send_when_signup(@user).deliver #確認メールを送信
      redirect_to @user
    else
      render 'new'
    end
  end
end
