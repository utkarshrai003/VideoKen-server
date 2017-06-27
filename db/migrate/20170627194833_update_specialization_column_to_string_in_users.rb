class UpdateSpecializationColumnToStringInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :specialization, :string 
  end
end
