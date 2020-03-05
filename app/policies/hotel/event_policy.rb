class Hotel::EventPolicy < ApplicationPolicy
  # [...]
  class Scope < Scope
    def resolve
      scope.all
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

  def edit
    user_is_hotel?
  end

  def update
    user_is_hotel?
  end

  def destroy
    user_is_hotel?
  end


  private

  def user_is_hotel?
    record.user == hotel
  end
end
