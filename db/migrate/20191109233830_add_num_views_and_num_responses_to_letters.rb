class AddNumViewsAndNumResponsesToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :num_views, :integer, :default => 0
    add_column :letters, :num_responses, :integer, :default => 0
  end
end
