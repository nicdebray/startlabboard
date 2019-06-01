class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # any user can see any job offer
  end

  def create?
    user_is_owner?
  end

  def update?
    user_is_owner? # only owner can do it
  end

  def destroy?
    user_is_owner? # only owner can do it
  end

  private

  def user_is_owner?
    Company.find(record.company_id).user_id == user.id
  end
end
