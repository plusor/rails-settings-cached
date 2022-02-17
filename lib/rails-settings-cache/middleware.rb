module RailsSettingsCache
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      RailsSettingsCache::RequestCache.enable!
      result = @app.call(env)
      RailsSettingsCache::RequestCache.disable!
      result
    end
  end
end
