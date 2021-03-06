module Liability
  class Package
    attr_reader :name, :pre_processors, :post_processors

    def initialize(name, &block)
      @name = name
      @pre_processors = []
      @post_processors = []
      instance_eval(&block) if block
    end

    def source(new_source=nil)
      @source = new_source if new_source
      @source
    end

    def files(new_files=nil)
      @files = new_files if new_files
      @files
    end

    def paths
      file_objects.map { |f| f.path }
    end

    def pre_processor(name=nil, &block)
      block = Liability.pre_processors[name] if name
      @pre_processors.push(block)
    end

    def post_processor(name=nil, &block)
      block = Liability.post_processors[name] if name
      @post_processors.push(block)
    end

    def generate
      Liability::Bundle.new(self, file_objects).generate
    end

  protected

    def file_objects
      files.map { |file| Liability::File.new(self, file) }
    end
  end
end
