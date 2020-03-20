class RemoveUserIdFromAnotaciones < ActiveRecord::Migration[6.0]
  def change

    remove_column :anotaciones, :user_id, :bigint
  end
end
