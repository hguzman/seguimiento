class AddFichaToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :ficha, index: true
  end
end
