require 'spec_helper'

describe Liability do
  let(:path) { File.expand_path("assets", File.dirname(__FILE__)) }

  describe '.package' do
    it "adds a package to the list" do
      Liability.package "app.js" do
        source "my/path"
      end
      Liability.packages["app.js"].name.should == "app.js"
      Liability.packages["app.js"].source.should == "my/path"
    end
  end

  describe ".configure" do
    it "runs the given block in the class context" do
      Liability.configure do
        package "app.js"
        package "foo.js"
      end
      Liability.packages["app.js"].name.should == "app.js"
      Liability.packages["foo.js"].name.should == "foo.js"
    end
  end
end
