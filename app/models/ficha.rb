class Ficha < ApplicationRecord
    belongs_to :especialidad
    has_many :users
end
