class AddCreatedByToComentario < ActiveRecord::Migration[6.0]
  def change
    add_column :comentarios, :created_by, :integer
    add_column :comentarios, :updated_by, :integer
  end
end
