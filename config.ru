require_relative './config/environment'
require_relative 'app/controllers/condos/condos_controller'

require './config/environment'
require 'sinatra'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use CondosController
run ApplicationController
