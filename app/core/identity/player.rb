# frozen_string_literal: true

module Identity
  class Player < User
    def role
      Identity::Role::PLAYER
    end
  end
end
