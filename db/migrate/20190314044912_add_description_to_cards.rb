class AddDescriptionToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :description, :text
  end
end
