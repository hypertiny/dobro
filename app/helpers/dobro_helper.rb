module DobroHelper
  def standard_dobro_columns
    singular_class.columns.select { |column|
      !hidden_dobro_column_names.include?(column.name.to_s)
    }
  end

  def dobro_field_for(form, column)
    column_name = column.name.to_sym
    case column.type.to_sym
    when :integer
      form.text_field column_name, :class => 'integer'
    when :date
      form.text_field column_name, :placeholder => 'yyyy-mm-dd'
    when :text
      form.text_area column_name
    when :boolean
      form.check_box column_name
    else
      form.text_field column_name
    end
  end

  private

  def hidden_dobro_column_names
    %w( id created_at updated_at )
  end
end
