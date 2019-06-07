class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all             # all users can see all job offers
    end

    def my_job_offers?
      scope.all
    end
  end

  def show?
    user_is_owner_or_record_is_published?  # any user can see any job offer
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

  def toggle_published?
    user_is_owner?          # only owner of the jo's company can
  end

  private

  def user_is_owner?
    # check the owner of the company for which a jo is done
    Company.find(record.company_id).user_id == user.id
  end

  def user_is_owner_or_record_is_published?
    # check the owner of the company for which a jo is done
    if record.published || user_is_owner?
      true
    end
  end
end
