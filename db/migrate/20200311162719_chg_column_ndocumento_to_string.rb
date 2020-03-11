class ChgColumnNdocumentoToString < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :ndocumento, :string
  end
end
