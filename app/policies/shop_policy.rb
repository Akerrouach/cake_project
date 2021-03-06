class ShopPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    true
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
