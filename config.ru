# frozen_string_literal: true

if ENV.key?('SENTRY_DSN')
  require 'raven'
  Raven.configure do |config|
    config.dsn = ENV.fetch('SENTRY_DSN')
  end
  use Raven::Rack
end

if ENV.key?('SKYLIGHT_AUTHENTICATION')
  require 'skylight'
  Skylight.start!
  use Skylight::Middleware
  Skylight.probe(:sequel, :tilt)
end

require 'punk'
PUNK.init(task: 'server').exec
run PUNK.app
