class PastryPolicy < ApplicationPolicy
  def create?
    record.shop.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
