class AddStatusColumnToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :pending, :boolean, default: :true
  end
end
