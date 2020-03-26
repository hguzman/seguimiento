require 'rails_helper'

RSpec.describe Ficha, type: :model do
  it { should have_db_column(:numero).of_type(:integer) }
  it { should have_db_column(:naprendices).of_type(:integer) }
  it { should have_db_column(:fechafin).of_type(:date) }
  it { should belong_to(:especialidad) }
  it { should have_many(:users) }
end
