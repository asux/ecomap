set :deploy_to, "#{application_root}/staging"
set :rails_env, "staging"
depend :remote, :directory, "#{shared_path}/cache"
