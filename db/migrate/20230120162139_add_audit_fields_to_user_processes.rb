class AddAuditFieldsToUserProcesses < ActiveRecord::Migration[7.0]
  def change
    add_column :user_processes, :prazo, :string
    add_column :user_processes, :avaliacao, :float
  end
end
