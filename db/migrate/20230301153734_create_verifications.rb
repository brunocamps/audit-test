class CreateVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :verifications do |t|
      t.string :name
      t.string :goal
      t.string :deadline
      t.float :weight
      t.float :grade
      t.references :evaluation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
