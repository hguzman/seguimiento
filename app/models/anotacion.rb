# frozen_string_literal: true

# Clase anotaciones
class Anotacion < ApplicationRecord
  belongs_to :anotable, polymorphic: true
  has_many :comentarios, dependent: :destroy

  def global_anotable
    anotable.to_global_id if anotable.present?
  end

  def global_anotable=(anotable)
    self.anotable = GlobalID::Locator.locate anotable
  end
end
