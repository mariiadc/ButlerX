class Guest::RoomPolicy < ApplicationPolicy
  # [...]
  def show?
    return true
  end

  def key?
    true
  end
end
