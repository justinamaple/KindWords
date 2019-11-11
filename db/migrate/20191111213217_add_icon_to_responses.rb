class AddIconToResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :icon, :string
  end
end
