class AddPunctuationToVerifications < ActiveRecord::Migration[7.0]
  def change
    add_column :verifications, :punctuation, :float
  end
end
