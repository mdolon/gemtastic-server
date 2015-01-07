
set :stage, :staging
set :branch, "develop"
set :stage_url, "http://staging.gemtastic.org"
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, "staging.gemtastic.org"

server "staging.gemtastic.org", user: "mdolon", roles: %w{web app db}, primary: true
set :deploy_to, "/home/www/gemtastic.org/app/staging"

set :rails_env, :production
set :unicorn_worker_count, 5
set :enable_ssl, false
