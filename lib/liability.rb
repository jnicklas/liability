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

    def pre_processors
      @pre_processors ||= {}
    end

    def post_processors
      @pre_processors ||= {}
    end

    def pre_processor(name, &block)
      pre_processors[name] = block
    end

    def post_processor(name, &block)
      post_processors[name] = block
    end
  end
end
