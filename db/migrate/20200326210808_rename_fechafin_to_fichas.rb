class RenameFechafinToFichas < ActiveRecord::Migration[6.0]
  def change
    rename_column :fichas, :fechafin, :fecha_fin_at
    rename_column :fichas, :naprendices, :numero_aprendices
  end
end
