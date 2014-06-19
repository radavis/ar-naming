class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :model_name, null: false
      t.timestamps
    end
  end
end
