class SpeciesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user&.editor? || user&.admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
