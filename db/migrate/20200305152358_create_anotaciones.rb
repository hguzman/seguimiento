class CreateAnotaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :anotaciones do |t|
      t.text :descripcion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :comentario, :anotaciones, foreign_key: true

  end
end
