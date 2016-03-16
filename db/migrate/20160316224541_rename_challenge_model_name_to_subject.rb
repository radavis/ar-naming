class RenameChallengeModelNameToSubject < ActiveRecord::Migration
  def change
    rename_column :challenges, :model_name, :subject
  end
end
