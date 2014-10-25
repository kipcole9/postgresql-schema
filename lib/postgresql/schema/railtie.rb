module Postgresql
  module Inheritance
    class Railtie < Rails::Railtie
      initializer "postgres-schema.configure_rails_initialization" do
        ActiveSupport.on_load(:active_record) do
          dir = File.dirname(__FILE__)
          require "#{dir}/schema_statements.rb"
          require "#{dir}/schema_dumper.rb"
        end
      end
    end
  end
end

