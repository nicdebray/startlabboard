class AddPublishedToJobOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :job_offers, :published, :boolean, default: true
  end
end
