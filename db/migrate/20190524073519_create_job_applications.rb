class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :motivation
      t.references :job_offer, foreign_key: true

      t.timestamps
    end
  end
end
