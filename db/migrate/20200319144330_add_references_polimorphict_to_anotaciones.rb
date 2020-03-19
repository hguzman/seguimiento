class AddReferencesPolimorphictToAnotaciones < ActiveRecord::Migration[6.0]
  def change
    add_reference :anotaciones, :anotable, polymorphic: true, null: false
  end
end
