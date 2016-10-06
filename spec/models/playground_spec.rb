# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Playground, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:files).class_name('SourceFile') }
end
