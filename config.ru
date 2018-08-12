# frozen_string_literal: true

require_relative 'app'

use Rack::Deflater
run Jps::App
