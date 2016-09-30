class User < ApplicationRecord
  class Token
    class << self
      def new
        SecureRandom.hex(20).encode('UTF-8')
      end
    end
  end
end
