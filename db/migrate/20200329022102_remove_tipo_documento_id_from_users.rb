class RemoveTipoDocumentoIdFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :tipodocumento_id, :bigint
  end
end
