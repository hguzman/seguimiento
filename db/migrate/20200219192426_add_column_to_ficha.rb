class AddColumnToFicha < ActiveRecord::Migration[6.0]
  def change
    add_column :fichas, :naprendices, :integer
    add_column :fichas, :fechafin, :date
  end
end
