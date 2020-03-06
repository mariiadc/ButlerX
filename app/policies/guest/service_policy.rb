class Guest::ServicePolicy < ApplicationPolicy
  # [...]
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  def show?
    return true
  end
end
