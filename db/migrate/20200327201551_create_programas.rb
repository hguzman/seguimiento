class CreateProgramas < ActiveRecord::Migration[6.0]
  def change
    create_table :programas do |t|
      t.string :nombre
      t.references :especialidad, foreign_key: true

      t.timestamps
    end

    remove_reference :fichas, :especialidad, foreign_key: true
    add_reference :fichas, :programa, foreign_key: true
  end
end
