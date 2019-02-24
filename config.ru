require_relative './config/environment'


require './config/environment'
require 'sinatra'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#starting application
use Rack::MethodOverride#mount controller
use PostsController
use StudySessionsController
use UsersController
use SessionsController
use MessagesController
run ApplicationController
