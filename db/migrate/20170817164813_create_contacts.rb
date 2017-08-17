class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :nimi
      t.string :epost
      t.text :kommentaar
      t.timestamps
    end
  end
end
