# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Playground, type: :model do
  it { is_expected.to have_db_column(:html).of_type(:text) }
  it { is_expected.to have_db_column(:css).of_type(:text) }
  it { is_expected.to have_db_column(:js).of_type(:text) }
  it { is_expected.to belong_to(:user) }
end
