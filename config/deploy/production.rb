set :deploy_to, "#{application_root}/production"
set :rails_env, "production"
# Deploy to production site only from stable branch
set :branch, "stable"
