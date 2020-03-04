class CreateTipodocumentos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipodocumentos do |t|
      t.string :nombre

      t.timestamps
    end
    add_reference :users, :tipodocumento, index: true
  end
end
