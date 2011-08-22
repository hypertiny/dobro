ActiveRecord::Schema.define do
  create_table(:pages, :force => true) do |t|
    t.string :name
    t.text   :content
    t.timestamps
  end

  create_table(:tasks, :force => true) do |t|
    t.string :description
    t.boolean :approved
  end

  create_table(:widgets, :force => true) do |t|
    t.string :name
    t.timestamps
  end
end
