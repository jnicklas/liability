require 'spec_helper'

describe Liability::Package do
  let(:package) { Liability::Package.new('application.js') }
  let(:path) { File.expand_path('assets', File.dirname(__FILE__)) }

  it "evaluates the block given to the constructor" do
    package = Liability::Package.new('application.js') { source('foo/bar') }
    package.source.should == 'foo/bar'
  end

  describe "#name" do
    it "is remembered" do
      package.name.should == 'application.js'
    end
  end

  describe "#source" do
    it "sets the source for this package" do
      package.source path
      package.source.should == path
    end
  end

  describe "#files" do
    it "sets up which files are included in this package" do
      package.files %w(foo.js bar.js)
      package.files.should == %w(foo.js bar.js)
    end
  end

  describe "#paths" do
    it "expands the files to their full paths relative the source dir" do
      package.source path
      package.files %w(foo.js bar.js)
      package.paths.should == [File.expand_path('foo.js', path), File.expand_path('bar.js', path)]
    end
  end

  describe "#generate" do
    it "concats all the files, separating with a line break" do
      package.source path
      package.files %w(foo.js bar.js)
      package.generate.should == "FOOfile\nInABar"
    end
  end

  describe "#pre_processor" do
    it "processes each file individually before merging them" do
      package.source path
      package.files %w(foo.js bar.js)
      package.pre_processor { |file| file.read.reverse }
      package.generate.should == "elifOOF\nraBAnI"
    end

    it "applies multiple processors" do
      package.source path
      package.files %w(foo.js bar.js)
      package.pre_processor { |file| file.read.reverse }
      package.pre_processor { |file| file.read.upcase }
      package.generate.should == "ELIFOOF\nRABANI"
    end
  end

  describe "#post_processor" do
    it "processes resulting file in its entirety" do
      package.source path
      package.files %w(foo.js bar.js)
      package.post_processor { |bundle| bundle.read.reverse }
      package.generate.should == "raBAnI\nelifOOF"
    end

    it "applies multiple processors" do
      package.source path
      package.files %w(foo.js bar.js)
      package.post_processor { |bundle| bundle.read.reverse }
      package.post_processor { |bundle| bundle.read.upcase }
      package.generate.should == "RABANI\nELIFOOF"
    end
  end

end
