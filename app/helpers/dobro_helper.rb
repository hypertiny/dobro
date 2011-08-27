module DobroHelper
  def standard_dobro_columns
    singular_class.columns.select { |column|
      !hidden_dobro_column_names.include?(column.name.to_s)
    }
  end

  def hidden_dobro_column_names
    %w( id created_at updated_at )
  end
end
