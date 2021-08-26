require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Nlfs
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = "zh-TW"
    config.i18n.available_locales = [:"zh-TW", :zh]
    config.time_zone = "Taipei"
  end
end
