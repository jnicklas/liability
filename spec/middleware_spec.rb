require 'spec_helper'
require 'rack/test'

describe Liability::Middleware do
  include Rack::Test::Methods

  let :app do
    Rack::Builder.new do
      use Liability::Middleware
      map "/testing" do
        run lambda { |env| [200, {}, "Other stuff"]}
      end
    end
  end

  before do
    Liability.configure do
      package "app.js" do
        source File.expand_path('assets', File.dirname(__FILE__))
        files %w(foo.js bar.js)
        pre_processor { |file| file.read.reverse }
      end
      package "foo.js" do
        source File.expand_path('assets', File.dirname(__FILE__))
        files %w(foo.js)
        pre_processor { |file| file.read.upcase }
      end
    end
  end

  it "should not eat up other requests" do
    get '/testing'
    last_response.body.should == "Other stuff"
  end

  it "should make packages available at /liability" do
    get '/liability/app.js'
    last_response.body.should == "elifOOF\nraBAnI"
    get '/liability/foo.js'
    last_response.body.should == "FOOFILE"
    get '/liability/baz.js'
    last_response.body.should =~ /Not Found/
  end
end
