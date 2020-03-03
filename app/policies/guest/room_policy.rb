class Guest::RoomPolicy < ApplicationPolicy
  # [...]
  def show?
    return true
  end
end
