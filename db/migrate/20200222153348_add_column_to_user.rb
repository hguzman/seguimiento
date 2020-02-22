class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :ndocumento, :bigint
    add_column :users, :telefono, :bigint
    add_column :users, :direccion, :string
  end
end
