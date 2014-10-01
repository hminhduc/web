#!/usr/bin/env ruby
# vim: set nosta noet ts=4 sw=4:
# encoding: utf-8

require 'pg'

# This is a minimal example of a function that can test an existing PG::Connection and
# reset it if necessary.
class PgHelper
	attr_reader    :db_user, :db_password, :db_server, :port, :host
  attr_accessor  :db_user, :db_password, :db_server, :port, :host

  def initialize
    config   = Rails.configuration.database_configuration
    database = config[Rails.env]["database"]
    username = config[Rails.env]["username"]
    password = config[Rails.env]["password"]
    port 		 = config[Rails.env]["port"]
    host 		 = config[Rails.env]["host"]

    database = 'yayoi' if database.nil?
    username = 'hoangminhduc' if username.nil?
    password = '' if password.nil?
    host = 'localhost' if password.nil?
    port = 5432 if port.nil?

    @db_user = username
    @db_server = database
    @db_password = password
    @port = port
    @host = host
  end

  def create_connect
    # conn = OCI8.new(@db_user, @db_password, @db_server)
    conn = PG.connect( dbname: @db_server, port: @port, host: @host, user: @db_user, password: @db_password )
		# conn = PG.connect( dbname: 'yayoi', port: 5432, host: 'localhost', user: 'yayoi', password: 'yayoi' )
  end

	def check_connection
		conn = create_connect
		begin
			result = conn.exec( "SELECT 1" )
		rescue PG::Error => err
			$stderr.puts "%p while testing connection: %s" % [ err.class, err.message ]
			conn.reset
			return '-1'
		end
		return '0'
	end

  def execute_query(query)
    conn = create_connect
    Rails.logger.info("PG execute query:#{query}")
    begin
      result = conn.exec( query )
    rescue PG::Error => err
      $stderr.puts "%p while testing connection: %s" % [ err.class, err.message ]
      Rails.logger.info(err.message)
      conn.reset
      return '-1'
    end
    return '0'
  end

  def execute_query_old(query)
		conn = create_connect
		Rails.logger.info("PG execute query:#{query}")
		return conn.exec( query )
	end

  def execute_select_query(query)
    conn = create_connect
    Rails.logger.info("PG execute select query :#{query}")
    return conn.exec(query)
  end

	def execute_select_query_one(query)
    conn = create_connect
    Rails.logger.info("PG execute select query one :#{query}")
    result = conn.exec(query)
    ret = {}
    result.each do |hash|
    	ret = hash
    end
  	return ret
  end

end
