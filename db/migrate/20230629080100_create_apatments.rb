class CreateApatments < ActiveRecord::Migration[7.0]
  def change
    create_table :apatments do |t|
      t.integer :number

      t.timestamps
    end
  end
end
