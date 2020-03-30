class AddReferenceTipoDocumentoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :tipodocumento, null: false, foreign_key: true
  end
end
