class AddAnotacionToComentarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :anotaciones, :comentarios, foreing_key: true
  end
end
