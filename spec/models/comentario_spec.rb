require 'rails_helper'

RSpec.describe Comentario, type: :model do
  
  it { should have_db_column(:comentario).of_type(:string) }
  it { should belong_to(:anotacion) }
  
end
