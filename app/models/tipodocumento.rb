class Tipodocumento < ApplicationRecord
    validates :nombre, presence: true

    has_many :users, dependent: :destroy
    validates :nombre, presence: true
end
