module GreatAss
  autoload :Package, 'great_ass/package'
  autoload :File, 'great_ass/file'
  autoload :Bundle, 'great_ass/bundle'
  autoload :Middleware, 'great_ass/middleware'

  class << self
    def package(name, &block)
      packages[name] = GreatAss::Package.new(name, &block)
    end

    def packages
      @packages ||= {}
    end

    def configure(&block)
      instance_eval(&block)
    end
  end
end
