class Guest::BillPolicy < ApplicationPolicy
  # [...]

  class Scope < Scope
    def resolve
      scope.where(guest: user)
    end
  end

  def show?
    return true
  end
end
