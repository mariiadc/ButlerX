class Guest::MealPolicy < ApplicationPolicy
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
