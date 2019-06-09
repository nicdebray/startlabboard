class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_owner?            # only owner can see his/her company page
  end

  private

  def user_is_owner?
    record.id == user.id
  end
end
