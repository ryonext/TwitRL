#encoding: utf-8
class ListController < ApplicationController
  def index
  end

  def select
    #OAuthする
    
    auth = request.env["omniauth.auth"]
    session[:token] = auth['credentials']['token']
    session[:secret] = auth['credentials']['secret']
    Twitter.configure do |config|
#      config.consumer_key =  'cNa4bLkDOTkmHgCGMgybSw'
#      config.consumer_secret = 'bCQbpcANe5DjZoi8d04lZuEdvh8TqRD7voSt96ximS4'
      config.oauth_token = session[:token]
      config.oauth_token_secret = session[:secret]
    end
    

    #フォローした人を取得する
    followers = Twitter.friend_ids
    collection = followers['collection']
    @userlist = Twitter.users(collection[0..19])
  end

  def create
    targetMembers = params[:list_check]
    Twitter.configure do|config|
      config.oauth_token = session[:token]
      config.oauth_token_secret = session[:secret]
    end
    #リスト名
    list_name = "TwitRL_#{Date.today}"
    #リストに突っ込む
    newList = Twitter.list_create(list_name)
    Twitter.list_add_members(newList['id'], targetMembers)
    #完成
  end

end
