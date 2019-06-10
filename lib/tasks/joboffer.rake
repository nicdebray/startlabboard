namespace :joboffer do
  desc "Unpublished old joboffer"
  task unpublished_jo_start_date_past: :environment do
    joboffers = JobOffer.where(published: true)
    puts "Enqueuing joboffer status"
    joboffers.each do |joboffer|
      UnpublishedJoStartDatePastJob.perform_now(joboffer.id)
    end
  end
end
