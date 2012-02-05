class ListController < ApplicationController
  def index
  end

  def select
    #さて。
    #OAuthする
    
    auth = request.env["omniauth.auth"]
    p auth
    #p auth.credentials.secret
    #p auth.credentials.token
    Twitter.configure do |config|
      config.consumer_key =  'cNa4bLkDOTkmHgCGMgybSw'
      config.consumer_secret = 'bCQbpcANe5DjZoi8d04lZuEdvh8TqRD7voSt96ximS4'
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end
    #フォローした人を取得する
    @followers = Twitter.followers
    #表示する
  end

  def create
  end

end
