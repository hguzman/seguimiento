class AddEspToFicha < ActiveRecord::Migration[6.0]
  def change
    add_reference :fichas, :especialidad, null: false, foreign_key: true
  end
end
