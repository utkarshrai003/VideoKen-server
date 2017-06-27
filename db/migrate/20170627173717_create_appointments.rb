class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :physician_id
      t.string :diseases

      t.timestamps
    end
  end
end
