class RenameMechanicsYearsOfExperience < ActiveRecord::Migration[5.2]
  def change
    rename_column :mechanics, :years_of_experiance, :years_of_experience
  end
end
