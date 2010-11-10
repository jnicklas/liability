module GreatAss
  class File
    attr_reader :name, :package

    def initialize(package, name, contents=nil)
      @package = package
      @name = name
      @contents = contents
    end

    def path
      ::File.expand_path(name, package.source)
    end

    def read
      @contents or ::File.read(path).chomp
    end

    def generate
      package.pre_processors.inject(self) do |file, pre_processor|
        GreatAss::File.new(package, name, pre_processor.call(file))
      end.read
    end
  end
end
