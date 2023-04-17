class CreateCompanyAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :company_areas do |t|
      t.string :name

      t.timestamps
    end
    change_table :users do |t|
      t.references(:company_area, foreign_key: true)
    end
  end
end
