# frozen_string_literal: true

module RailsSettingsCache
  class Railtie < Rails::Railtie
    initializer "rails_settings_cache.active_record.initialization" do
      RailsSettingsCache::Base.after_commit :clear_cache, on: %i[create update destroy]
    end

    initializer "rails_settings_cache.configure_rails_initialization" do |app|
      app.middleware.use RailsSettingsCache::Middleware
    end
  end
end
