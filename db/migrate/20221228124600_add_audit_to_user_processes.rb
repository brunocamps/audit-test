class AddAuditToUserProcesses < ActiveRecord::Migration[7.0]
  def change
    add_column :user_processes, :checklist_ideal, :text
    add_column :user_processes, :checklist_real, :text
    add_column :user_processes, :peso_processo, :integer
    add_column :user_processes, :diagnostico, :integer
  end
end
