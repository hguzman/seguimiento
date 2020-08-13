class AddFileToAnotacion < ActiveRecord::Migration[6.0]
  def change
    add_column :anotaciones, :file, :string
  end
end
