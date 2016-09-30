require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:remember_token) }
  it { is_expected.to have_many(:playgrounds) }
end
