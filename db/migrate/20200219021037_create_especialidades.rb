class CreateEspecialidades < ActiveRecord::Migration[6.0]
  def change
    create_table :especialidades do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
