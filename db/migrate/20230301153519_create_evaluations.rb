class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.string :name
      t.references :company_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
