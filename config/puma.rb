# frozen_string_literal: true

workers Integer(ENV.fetch('WEB_CONCURRENCY', 4))
threads_count = Integer(ENV.fetch('MAX_THREADS', 5))
threads threads_count, threads_count
rackup DefaultRackup
port ENV.fetch('PORT', 3000)
environment ENV.fetch('RACK_ENV', 'development')
wait_for_less_busy_worker 0.001
if ENV.key?('SENTRY_DSN')
  lowlevel_error_handler do |e, env|
    Sentry.capture_exception(
      e,
      message: e.message,
      extra: { puma: env },
      transaction: "Puma"
    )
    # NOTE: the below is just a Rack response
    [500, {}, ["An error has occurred, and engineers have been informed. Please reload the page. If you continue to have problems, contact support@example.com\n"]]
  end
end
