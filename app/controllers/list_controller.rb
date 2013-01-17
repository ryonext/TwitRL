#encoding: utf-8
class ListController < ApplicationController
  def index
  end

  def authorize
    #OAuthする
    auth = request.env["omniauth.auth"]
    Twitter.configure do |config|
      config.oauth_token = auth['credentials']['token']
      config.oauth_token_secret = auth['credentials']['secret']
    end
    redirect_to :action=>'select'
  end

  def select
    #フォローした人を取得する
#    followers = Twitter.friend_ids
#    binding.pry
#    collection = followers.ids
    @userlist = Twitter.friends.users
    @user = Twitter.user
    #ログに書く
    log = Usedlog.new
    log.screen_name = @user.screen_name
    log.lang = @user.lang
    log.location = @user.location
    log.profile = @user.description
    log.save
  end

  def create
    targetMembers = params[:list_check]
    if targetMembers == nil || targetMembers.length == 0
      flash[:alert] = "誰か選んでください・・・（´・ω・｀）"
      redirect_to :action=>'select'
      return
    end
    #リスト名
    @list_name = "TwitRL_#{Date.today}"
    #リストに突っ込む
    newList = Twitter.list_create(@list_name)
    #2回に分けてやる
    Twitter.list_add_members(newList['id'], targetMembers[0..9])
    if targetMembers.length > 10
      Twitter.list_add_members(newList['id'], targetMembers[10..19])
    end
    #完成
    @list_url = "https://twitter.com/#!/#{Twitter.user.screen_name}/lists"
  end

end
