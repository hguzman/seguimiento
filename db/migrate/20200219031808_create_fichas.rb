class CreateFichas < ActiveRecord::Migration[6.0]
  def change
    create_table :fichas do |t|
      t.integer :numero
      t.timestamps
    end
  end
end
