# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord
  has_many :playgrounds

  # A secure token for remember a user between sessions
  class Token
    class << self
      def new
        SecureRandom.hex(20).encode('UTF-8')
      end
    end
  end
end
