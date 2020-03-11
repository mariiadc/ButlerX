class Guest::CartPolicy < ApplicationPolicy
  # [...]

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user == record.user
  end

  def pay?
    user == record.user
  end

  def checkout?
    user == record.user
  end
end
