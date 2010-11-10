describe GreatAss do
  let(:path) { File.expand_path("assets", File.dirname(__FILE__)) }

  describe '.package' do
    it "adds a package to the list" do
      GreatAss.package "app.js" do
        source "my/path"
      end
      GreatAss.packages["app.js"].name.should == "app.js"
      GreatAss.packages["app.js"].source.should == "my/path"
    end
  end

  describe ".configure" do
    it "runs the given block in the class context" do
      GreatAss.configure do
        package "app.js"
        package "foo.js"
      end
      GreatAss.packages["app.js"].name.should == "app.js"
      GreatAss.packages["foo.js"].name.should == "foo.js"
    end
  end
end
