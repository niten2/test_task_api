require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module TestTaskApi
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller
    config.active_job.queue_adapter = :sidekiq

    config.active_record.raise_in_transactional_callbacks = true
    # config.i18n.default_locale = :ru

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_spec: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false,
                       controller_spec: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
