class JobApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user_is_owner? || user_is_jo_company_owner?
  end

  def create?
    user_cant_apply_own_offers?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_jo_company_owner?
    Company.find(JobOffer.find(record.job_offer_id).company_id).user_id == user.id
  end

  def user_cant_apply_own_offers?
    if Company.find(JobOffer.find(record.job_offer_id).company_id).user_id == user.id
      false
    else
      true
    end
  end

end
