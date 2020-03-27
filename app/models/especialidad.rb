class Especialidad < ApplicationRecord
    validates :nombre, presence: true
    has_many :programas, dependent: :destroy
end
