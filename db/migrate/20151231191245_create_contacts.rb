class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, limit: 70
      t.string :email, limit: 70
      t.text :message
      t.boolean :is_read, default: false
      t.timestamps null: false
    end
  end
end
