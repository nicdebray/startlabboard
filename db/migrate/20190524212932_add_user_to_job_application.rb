class AddUserToJobApplication < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_applications, :user, foreign_key: true
  end
end
