# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'sandwich'
set :repo_url, 'git@github.com:sausage-sandwich/sandwich.git'
set :deploy_to, '/var/www/sandwich'
set :rbenv_ruby, '2.7.4'
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :bundle_flags, ''

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
