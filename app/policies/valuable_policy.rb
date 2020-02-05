class ValuablePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def items?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    user_is_owner
  end

  def update?
    user_is_owner
  end

  def destroy?
    user_is_owner
  end

  private

  def user_is_owner
    record.user == user
  end
end
