class CreateNovedades < ActiveRecord::Migration[6.0]
  def change
    create_table :novedades do |t|

      t.string :titulo
      t.text :descripcion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
