class FirstoneJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm starting this first one job"
    sleep 7
    puts "OK I'm done let do something else"
  end
end
