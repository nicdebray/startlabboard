class UnpublishedJoStartDatePastJob < ApplicationJob
  queue_as :default

  def perform(joboffer_id)
    joboffer = JobOffer.find(joboffer_id)
    puts "Job offer #{joboffer.id} status is: #{joboffer.published} at #{Time.now}."
    if joboffer.start_date < DateTime.now
      joboffer.published = false
      joboffer.save!
    end
    puts "Job offer #{joboffer.id} status: #{joboffer.published} at #{Time.now}."
  end
end
