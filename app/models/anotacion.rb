class Anotacion < ApplicationRecord
  belongs_to :anotable, polymorphic: true 
  has_many :comentarios

  def global_anotable
    self.anotable.to_global_id if self.anotable.present?
    end
    
    def global_anotable=(anotable)
    self.anotable=GlobalID::Locator.locate anotable
    end
end
