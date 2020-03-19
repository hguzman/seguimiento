class Ambiente < ApplicationRecord
    has_many :anotaciones, as: :anotable
end
