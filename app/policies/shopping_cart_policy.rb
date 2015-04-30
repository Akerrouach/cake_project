class ShoppingCartPolicy < ApplicationPolicy
  def create?
    record.user == user
  end
  def destroy?
    record.user == user
  end
  class Scope < Scope
    def resolve
      scope.where(user_id: user)
    end
  end
end
