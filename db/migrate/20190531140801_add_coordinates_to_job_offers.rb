class AddCoordinatesToJobOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :job_offers, :latitude, :float
    add_column :job_offers, :longitude, :float
  end
end
