class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|

      t.string :slug
      t.string :link
      t.text :embed_code
      t.timestamps null: false
    end
  end
end
