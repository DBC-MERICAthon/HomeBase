def oauth_consumer
  raise RuntimeError, "You must set your Google Client ID and Google Client Secret in your server environment" unless ENV['GOOGLE_CLIENT_ID'] && ENV['GOOGLE_CLIENT_SECRET']
