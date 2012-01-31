#encoding: utf-8
class SampleController < ApplicationController
  def index
  end

  def create
  end

 def callback
    auth = request.env["omniauth.auth"]
#    user = User.create_with_omniauth(auth)
#    session[:user_id] = user.id
p auth.credentials.secret
p auth.credentials.token
   Twitter.configure do |config|
  config.consumer_key =  'cNa4bLkDOTkmHgCGMgybSw'
  config.consumer_secret = 'bCQbpcANe5DjZoi8d04lZuEdvh8TqRD7voSt96ximS4'
  config.oauth_token = auth['credentials']['token']
  config.oauth_token_secret = auth['credentials']['secret']

end 

    Twitter.update("(´ε｀)")

    redirect_to :action => "index" , :notice => "ログインしました"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "ログアウトしました"
  end

end
