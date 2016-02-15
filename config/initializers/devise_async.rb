Devise::Async.setup do |config|
  config.backend = :sidekiq
  config.queue   = :default
end

Devise::Async.enabled = false # | false
