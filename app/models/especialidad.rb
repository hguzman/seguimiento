class Especialidad < ApplicationRecord
    validates :nombre, presence: true
    has_many :fichas
end
