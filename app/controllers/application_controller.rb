class ApplicationController < ActionController::Base
  
  # サインインした後のパス
  def after_sign_in_path_for(resource)
    tweets_path
  end

end
