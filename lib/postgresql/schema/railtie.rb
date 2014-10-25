module Postgresql
  module Inheritance
    class Railtie < Rails::Railtie
      initializer "postgres-inheritance.configure_rails_initialization" do
        dir = File.dirname(__FILE__)
        load "#{dir}/schema_statements.rb"
        load "#{dir}/schema_dumper.rb"
      end
    end
  end
end

