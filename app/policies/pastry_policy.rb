class PastryPolicy < ApplicationPolicy

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
