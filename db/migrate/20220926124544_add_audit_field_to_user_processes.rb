class AddAuditFieldToUserProcesses < ActiveRecord::Migration[7.0]
  def change
    add_column :user_processes, :auditoria, :string
  end
end
