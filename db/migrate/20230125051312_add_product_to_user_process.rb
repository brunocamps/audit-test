class AddProductToUserProcess < ActiveRecord::Migration[7.0]
  def change
    add_column :user_processes, :product, :float
  end
end
