module Liability
  class Middleware
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def call(env)
      package_name = env["PATH_INFO"][%r(^/liability/(.*)$), 1]
      if package_name and Liability.packages[package_name]
        [200, {}, Liability.packages[package_name].generate]
      else
        app.call(env)
      end
    end
  end
end
