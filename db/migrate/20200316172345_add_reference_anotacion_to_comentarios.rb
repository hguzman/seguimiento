class AddReferenceAnotacionToComentarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :comentarios, :anotacion, null: false, foreign_key: true
  end
end
