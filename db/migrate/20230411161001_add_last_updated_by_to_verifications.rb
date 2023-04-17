class AddLastUpdatedByToVerifications < ActiveRecord::Migration[7.0]
  def change
    add_column :verifications, :last_updated_by, :string
  end
end
