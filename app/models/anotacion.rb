# frozen_string_literal: true

# Clase anotaciones
class Anotacion < ApplicationRecord
  validates :descripcion, presence: true

  belongs_to :anotable, polymorphic: true
  has_many :comentarios, dependent: :destroy
  record_operator_on :create, :update

  def global_anotable
    anotable.to_global_id if anotable.present?
  end

  def global_anotable=(anotable)
    self.anotable = GlobalID::Locator.locate anotable
  end
end
