#encoding: utf-8
class ListController < ApplicationController
  def index
  end

  def authorize
    #OAuthする
    auth = request.env["omniauth.auth"]
    session[:token] = auth['credentials']['token']
    session[:secret] = auth['credentials']['secret']
    Twitter.configure do |config|
      config.oauth_token = session[:token]
      config.oauth_token_secret = session[:secret]
    end
    redirect_to :action=>'select'
  end

  def select
    #フォローした人を取得する
    followers = Twitter.friend_ids
    collection = followers['collection']
    @userlist = Twitter.users(collection[0..19])
    @user = Twitter.user
  end

  def create
    targetMembers = params[:list_check]
    if targetMembers == nil || targetMembers.length == 0
      flash[:alert] = "誰か選んでください・・・（´・ω・｀）"
      redirect_to :action=>'select'
      return
    end
    #リスト名
    list_name = "TwitRL_#{Date.today}"
    #リストに突っ込む
    newList = Twitter.list_create(list_name)
    Twitter.list_add_members(newList['id'], targetMembers)
    #完成
    @list_url = "https://twitter.com/#!/#{Twitter.user.screen_name}/lists"
    @list_name = newList.name
  end

end
