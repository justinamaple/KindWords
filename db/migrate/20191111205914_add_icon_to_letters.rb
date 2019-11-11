class AddIconToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :icon, :string
  end
end
