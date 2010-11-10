describe GreatAss do
  let(:path) { File.expand_path('assets', File.dirname(__FILE__)) }

  describe '.package' do
    it "adds a package to the list" do
      GreatAss.package "app.js" do
        source "my/path"
      end
      GreatAss.packages['app.js'].name.should == "app.js"
      GreatAss.packages['app.js'].source.should == "my/path"
    end
  end
end
