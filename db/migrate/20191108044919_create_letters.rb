class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.references :account, null: false, foreign_key: true
      t.string :content
      t.boolean :burned, default: false

      t.timestamps
    end
  end
end
