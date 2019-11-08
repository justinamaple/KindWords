class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :account, null: false, foreign_key: true
      t.references :letter, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
