class User < ApplicationRecord
  has_many :playgrounds

  class Token
    class << self
      def new
        SecureRandom.hex(20).encode('UTF-8')
      end
    end
  end
end
