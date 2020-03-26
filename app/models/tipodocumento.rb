class Tipodocumento < ApplicationRecord
    has_many :users, dependent: :destroy
    validates :nombre, presence: true
end
