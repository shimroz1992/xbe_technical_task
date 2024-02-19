
require 'sidekiq'
require 'sidekiq-cron'
require 'sidekiq/web'
require 'byebug'
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_server do |config|
  config.on(:startup) do
    hash = YAML.load_file(File.expand_path('config/sidekiq-cron.yml', Rails.root))
    Sidekiq::Cron::Job.load_from_hash hash
  end
end