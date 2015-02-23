module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module ColumnDumper
      def prepare_column_options(column, types)
        spec = {}
        spec[:name]      = column.name.inspect
        spec[:type]      = column.type.to_s
        spec[:limit]     = column.limit.inspect if types[column.type] && column.limit != types[column.type][:limit]
        spec[:precision] = column.precision.inspect if column.precision
        spec[:scale]     = column.scale.inspect if column.scale
        spec[:null]      = 'false' unless column.null
        spec[:default]   = schema_default(column) if column.has_default?
        spec.delete(:default) if spec[:default].nil?
        spec[:array] = 'true' if column.respond_to?(:array) && column.array
        spec[:default] = "\"#{column.default_function}\"" if column.default_function
        sql_type_without_schema = column.sql_type.split('.').last
        if enum_types.include?(sql_type_without_schema) || composite_types.include?(sql_type_without_schema) || domain_types.include?(sql_type_without_schema)
          spec[:type] = sql_type_without_schema 
          spec.delete(:limit)
        end
        spec
      end
    end
  end
end