module Liability
  autoload :Package, 'liability/package'
  autoload :File, 'liability/file'
  autoload :Bundle, 'liability/bundle'
  autoload :Middleware, 'liability/middleware'

  class << self
    def package(name, &block)
      packages[name] = Liability::Package.new(name, &block)
    end

    def packages
      @packages ||= {}
    end

    def configure(&block)
      instance_eval(&block)
    end
  end
end
