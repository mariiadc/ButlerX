class Guest::BillPolicy < ApplicationPolicy
  # [...]
  def show?
    return true
  end
end
