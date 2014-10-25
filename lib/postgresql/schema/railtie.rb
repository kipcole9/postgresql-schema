module Postgresql
  module Inheritance
    class Railtie < Rails::Railtie
      initializer "postgres-inheritance.configure_rails_initialization" do

      end
    end
  end
end

