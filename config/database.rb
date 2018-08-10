# frozen_string_literal: true

require 'sequel'

RACK_ENV = ENV['RACK_ENV'] || 'development' unless defined?(RACK_ENV)

require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

PORT = ENV['PGPORT'] || 5432 # Travis uses 5433
DB_BASE = "postgres://:#{PORT}/jps_" # leave host blank for Travis
DB = Sequel.connect(ENV['DATABASE_URL'] || DB_BASE + RACK_ENV)

Sequel.extension :migration
