class ChangeLocationToAddressInJobOffers < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_offers, :location, :address
  end
end
