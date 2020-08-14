class AddFileToComentario < ActiveRecord::Migration[6.0]
  def change
    add_column :comentarios, :file, :string
  end
end
