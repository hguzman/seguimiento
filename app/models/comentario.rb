class Comentario < ApplicationRecord
  validates :comentario, presence: true
  belongs_to :anotacion
  record_operator_on :create, :update
  mount_uploader :file, FileUploader
end
