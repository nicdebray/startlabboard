class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user_is_owner? # only owner can see his/her company page
  end

  def create?
    true # all users can create companies
  end

  def update?
    user_is_owner? # only owner can edit/update his/her company
  end

  def destroy?
    user_is_owner? # only owner can destroy his/her company
  end

  private

  def user_is_owner?
    record.user == user
  end
end
