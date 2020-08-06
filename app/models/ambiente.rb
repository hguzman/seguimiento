class Ambiente < ApplicationRecord
    validates :nombre, presence: true
    validates :descripcion, presence: true
    has_many :anotaciones, as: :anotable
end
