module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module ColumnDumper
   
    private

      # for enum types we emit the enum_type
      def schema_type(column)
        column.type.to_s == 'enum' ? column.sql_type.split('.').last : column.type.to_s
      end

      def schema_limit(column)
        limit = column.limit || (native_database_types[column.type] && native_database_types[column.type][:limit])
        limit.inspect if limit
      end
    end
  end
end
