# Load the Rails application.[Setting this value for oracle support japanese in sql query]
ENV['NLS_LANG'] = 'japanese_japan.al32utf8'
# production mode
ENV['RAILS_ENV'] ||= 'production'

require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Jpt::Application.initialize!
