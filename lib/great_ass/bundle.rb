module GreatAss
  class Bundle
    attr_reader :package, :file_objects

    def initialize(package, file_objects, contents=nil)
      @package = package
      @file_objects = file_objects
      @contents = contents
    end

    def read
      @contents || file_objects.map { |f| f.generate }.join("\n")
    end

    def generate
      package.post_processors.inject(self) do |bundle, post_processor|
        GreatAss::Bundle.new(package, file_objects, post_processor.call(bundle))
      end.read
    end

  end
end
