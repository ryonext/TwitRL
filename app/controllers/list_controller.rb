#encoding: utf-8
class ListController < ApplicationController
  def index
  end

  def select
    #さて。
    #OAuthする
    
    auth = request.env["omniauth.auth"]
    #p auth.credentials.secret
    #p auth.credentials.token
    Twitter.configure do |config|
      config.consumer_key =  'cNa4bLkDOTkmHgCGMgybSw'
      config.consumer_secret = 'bCQbpcANe5DjZoi8d04lZuEdvh8TqRD7voSt96ximS4'
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end
    

    #フォローした人を取得する
    p 1
    p followers = Twitter.follower_ids
    p collection = followers['collection']
    p collection[0]
    p Twitter.user(collection[0])
    p 2
    #表示する
  end

  def create
  end

end
