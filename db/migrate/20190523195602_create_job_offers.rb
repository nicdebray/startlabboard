class CreateJobOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_offers do |t|
      t.string :company
      t.string :category
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :phone_number
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
