module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module ColumnDumper
      # Enum types dont have a column.type so we get exceptions on line 12
      # hence the local fix.
      def prepare_column_options(column, types)
        spec = {}
        spec[:name]      = column.name.inspect
        spec[:type]      = column.type.to_s
        spec[:type]      = column.sql_type if spec[:type] == 'enum'  
        spec[:null]      = 'false' unless column.null

        limit = column.limit || (types[column.type] ? types[column.type][:limit] : nil)
        spec[:limit]     = limit.inspect if limit
        spec[:precision] = column.precision.inspect if column.precision
        spec[:scale]     = column.scale.inspect if column.scale

        default = schema_default(column) if column.has_default?
        spec[:default]   = default unless default.nil?

        spec
      end
    end
  end
end