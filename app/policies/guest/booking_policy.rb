class Guest::BookingPolicy < ApplicationPolicy
  # [...]
  class Scope < Scope
    def resolve
      scope.where(guest: user)
    end
  end

  def new?
    return true
  end


  def show?
    return true
  end


  def create?
    return true
  end
end
