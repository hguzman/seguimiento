class RemoveComentaiosIdFromAnotaciones < ActiveRecord::Migration[6.0]
  def change

    remove_column :anotaciones, :comentarios_id, :bigint
  end
end
