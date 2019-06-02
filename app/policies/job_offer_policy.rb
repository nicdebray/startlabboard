class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all             # all users can see all job offers
    end
  end

  def show?
    true                    # any user can see any job offer
  end

  def create?
    user_is_owner?          # only owner of the jo's company can
  end

  def update?
    user_is_owner?          # only owner of the jo's company can
  end

  def destroy?
    user_is_owner?          # only owner of the jo's company can
  end

  private

  def user_is_owner?
    # check the owner of the company for which a jo is done
    Company.find(record.company_id).user_id == user.id
  end
end
