class Programa < ApplicationRecord
  belongs_to :especialidad
  validates :nombre, presence: true
  has_many :fichas, dependent: :destroy
end
