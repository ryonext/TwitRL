#encoding: utf-8
class ListController < ApplicationController
  before_filter :authorize, :only => [:select]
  def index
  end

  def authorize
    #OAuthする
    auth = request.env["omniauth.auth"]
    session[:oauth_token] = auth['credentials']['token']
    session[:oauth_token_secret] = auth['credentials']['secret']
  end

  def select
    #フォローした人を取得する
    client = create_client_with_session
    @userlist = client.friends.users
    @user = client.user
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
    client = create_client_with_session
    newList = client.list_create(@list_name)
    #2回に分けてやる
    client.list_add_members(newList['id'], targetMembers[0..9])
    if targetMembers.length > 10
      client.list_add_members(newList['id'], targetMembers[10..19])
    end
    #完成
    @list_url = "https://twitter.com/#!/#{client.user.screen_name}/lists"
  end

  private

  def create_client_with_session
    @client = Twitter::Client.new(
      :oauth_token => session[:oauth_token],
      :oauth_token_secret => session[:oauth_token_secret]
    )
  end
end
