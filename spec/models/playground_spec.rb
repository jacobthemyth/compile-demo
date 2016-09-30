require 'rails_helper'

RSpec.describe Playground, type: :model do
  it { is_expected.to have_db_column(:html) }
  it { is_expected.to have_db_column(:css) }
  it { is_expected.to belong_to(:user) }
end
