class JobApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)            # only owner
    end
  end

  def show?
    user_is_owner? || user_is_jo_company_owner?    # applicant or jo's owner can see
  end

  def create?
    user_cant_apply_own_offers?          # only non jo owner can apply to a jo
  end

  def destroy?
    user_is_owner?                       # only applicant can destroy
  end

  private

  def user_is_owner?
    # check the owner of the application is the current user
    record.user == user
  end

  def user_is_jo_company_owner?
    # check the owner of company of the job offer of the current job application
    # is the current user, so (s)he can review the candidate's application
    Company.find(JobOffer.find(record.job_offer_id).company_id).user_id == user.id
  end

  def user_cant_apply_own_offers?
    # only non jo owner can apply to a jo
    if Company.find(JobOffer.find(record.job_offer_id).company_id).user_id == user.id
      false
    else
      true
    end
  end
end
