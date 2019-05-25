class RenameCompanyToCompanyName < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_offers, :company, :company_name
  end
end
