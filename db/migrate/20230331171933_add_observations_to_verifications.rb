class AddObservationsToVerifications < ActiveRecord::Migration[7.0]
  def change
    add_column :verifications, :observations, :string
  end
end
