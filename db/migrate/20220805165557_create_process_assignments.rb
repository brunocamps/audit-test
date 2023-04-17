class CreateProcessAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :process_assignments do |t|
      t.references(:user_process, null: false)
      t.references(:user, null: false)
    
      t.timestamps
    end
  end
end
