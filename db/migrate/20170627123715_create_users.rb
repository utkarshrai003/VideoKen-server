class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :number
      t.integer :age
      t.string :email
      t.integer :specialization

      t.timestamps
    end
  end
end
