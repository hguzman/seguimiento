class Ficha < ApplicationRecord
    belongs_to :programa
    has_many :users
end
