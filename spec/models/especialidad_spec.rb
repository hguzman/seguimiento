require 'rails_helper'

RSpec.describe Especialidad, type: :model do
  it { should have_db_column(:nombre).of_type(:string) }
  it { should have_many(:programas).dependent(:destroy) }
  it { should validate_presence_of(:nombre) }
end
