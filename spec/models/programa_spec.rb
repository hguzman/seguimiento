require 'rails_helper'

RSpec.describe Programa, type: :model do
  it { should have_db_column(:nombre).of_type(:string) }
  it { should belong_to(:especialidad) }
  it { should validate_presence_of(:nombre) }
  it { should have_many(:fichas).dependent(:destroy) }
end
