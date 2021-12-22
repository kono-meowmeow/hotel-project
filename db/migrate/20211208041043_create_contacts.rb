class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :emailaddress
      t.text :body

      t.timestamps
    end
  end
end
