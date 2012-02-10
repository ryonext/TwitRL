Twitter.configure do |config|
  config.consumer_key = ENV['consumer_key'] #自分で取得したconsumer_key。このアプリの場合はheroku上で設定する。
  config.consumer_secret = ENV['consumer_secret'] #同上
end
