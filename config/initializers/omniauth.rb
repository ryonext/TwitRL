Rails.application.config.middleware.use OmniAuth::Builder do
## Twitter
  provider :twitter, ENV['consumer_key'], ENV['consumer_secret'] 
end
