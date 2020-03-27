require 'rails_helper'

RSpec.describe Ambiente, type: :model do
  it { should have_db_column(:nombre).of_type(:string) }
  it { should have_db_column(:descripcion).of_type(:string) }

end
