class UpdateSpecializationColumnToStringInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :specialization, :string 
  end
end
