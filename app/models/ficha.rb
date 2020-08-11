class Ficha < ApplicationRecord
    # Campos obligatorios
    validates :numero, presence: true
    validates :fecha_fin_at, presence: true
    validates :numero_aprendices, presence: true

    belongs_to :programa
    has_many :users, dependent: :destroy
end
