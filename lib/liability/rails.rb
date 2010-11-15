require 'liability'
require 'rails'

module Liability
  class Railtie < Rails::Railtie
    initializer "liability.setup" do
      if ::File.exist?(Rails.root.join('config/liability.rb'))
        require Rails.root.join('config/liability.rb')
      end
      Rails.application.middleware.use Liability::Middleware
    end
  end
end
