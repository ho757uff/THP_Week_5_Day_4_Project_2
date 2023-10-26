class CreateDogSitters < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_sitters do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
