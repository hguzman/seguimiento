class AddCreateByToAnotacion < ActiveRecord::Migration[6.0]
  def change
    add_column :anotaciones, :created_by, :integer
    add_column :anotaciones, :updated_by, :integer
  end
end
