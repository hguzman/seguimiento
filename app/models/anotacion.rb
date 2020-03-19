class Anotacion < ApplicationRecord
  belongs_to :anotable, polymorphic: true 
  has_many :comentarios
end
