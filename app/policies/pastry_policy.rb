class PastryPolicy < ApplicationPolicy
  def create?
    record.shop.user == user
  end

  def show?
    true
  end

  def update?
    record.shop.user == user
  end

  def destroy?
    user == record.shop.user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
